unit mpChaves;

interface
uses windows, sysutils, dialogs;


procedure inicChaves (lpt: integer);    {1=$378 (normalmente), 2=$278, 3=$3bc
                                         outros=$378}
procedure obtemChaves;
procedure fimChaves;

implementation

uses mpVars;

const
    lpr_data    = 0;
    lpr_status  = 1;
    lpr_control = 2;

{
        Port 3BD printer status register   (Parallel Printer Port)

         ¦7¦6¦5¦4¦3¦2¦1¦0¦  ports 279, 379, 3BD
          ¦ ¦ ¦ ¦ ¦ ¦ ¦ +---- 1 = time-out
          ¦ ¦ ¦ ¦ ¦ +------- unused
          ¦ ¦ ¦ ¦ +-------- 1 = error,  pin 15
          ¦ ¦ ¦ +--------- 1 = on-line,  pin 13
          ¦ ¦ +---------- 1 = out of paper,  pin 12
          ¦ +----------- 0 = Acknowledge,  pin 10
          +------------ 0 = busy,  pin 11

        Port 3BE printer control register   (Parallel Printer Port)

         ¦7¦6¦5¦4¦3¦2¦1¦0¦  ports 27A, 37A, 3BE
          ¦ ¦ ¦ ¦ ¦ ¦ ¦ +---- 1 = output data to printer,  (pin 1)
          ¦ ¦ ¦ ¦ ¦ ¦ +----- 1 = auto line feed,  (pin 14)
          ¦ ¦ ¦ ¦ ¦ +------ 0 = initialize printer,  (pin 16)
          ¦ ¦ ¦ ¦ +------- 1 = printer reads output,  (pin 17)
          ¦ ¦ ¦ +-------- 0 = IRQ disable,1=IRQ enable for ACK
          +------------- unused
}


type
    TInp32 = function (PortAddress: word): byte;   stdcall;
    TOut32 = procedure (PortAddress: word; data: byte);   stdcall;

var
    Inp32: TInp32;
    Out32: TOut32;
    HLib: THandle;
    masc: byte;
    lpr_addr: integer;    // $378, $278 ou $3bc

procedure inicChaves (lpt: integer);    {1=$378, 2=$278, 3=$3bc, outros=$378}
begin
    if hLib <> 0 then exit;
    if chavesInibidas then exit;

    case lpt of
        2: lpr_addr := $278;
        3: lpr_addr := $3bc;
    else
        lpr_addr := $378;
    end;

    hLib := LoadLibrary ('inpout32.dll');
    if hLib = 0 then
        begin
            showMessage ('LoadLibrary Failed.');
            halt;
        end;

     inp32 := GetProcAddress(hLib, 'Inp32');
     out32 := GetProcAddress(hLib, 'Out32');

     out32 (lpr_addr + lpr_control, $ff);
     sleep (5);
     out32 (lpr_addr + lpr_data, 1);
     sleep (5);
     masc := inp32 (lpr_addr + lpr_status);
end;

procedure fimChaves;
begin
    if hLib <> 0 then
                                                                                                                       FreeLibrary(hLib);
    hLib := 0;
end;

procedure obtemChaves;
var x, i: integer;
begin
    for i := 0 to 7 do
        begin
            if chavesInibidas then
                x := $00
            else
                begin
                    out32 (lpr_addr + lpr_control, $ff);
                    sleep (5);
                    out32 (lpr_addr + lpr_data, ($80 shr i) xor $ff);
                    sleep (5);
                    x := inp32 (lpr_addr + lpr_status) xor masc;
                end;
            vetChaves[i*4+1] := (x and $80) <> 0;
            vetChaves[i*4+2] := (x and $40) <> 0;
            vetChaves[i*4+3] := (x and $20) <> 0;
            vetChaves[i*4+4] := (x and $10) <> 0;
        end;
end;

end.
