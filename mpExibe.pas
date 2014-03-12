unit mpExibe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, OleCtrls, ACTIVEVOICEPROJECTLib_TLB, mmSystem, activex,
  MPlayer;

type
  TformExibe = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    MediaPlayer1: TMediaPlayer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure meuClick(Sender: TObject);
  public
    { Public declarations }
    procedure ativaExibicao (n: integer);
    procedure tocaSom (som: string);
  end;

procedure montaMapa (umForm: TForm; meuClick: TNotifyEvent);
procedure fechaMapa;

var
  formExibe: TformExibe;

implementation

uses mpInic, mpVars, mpChaves;

{$R *.dfm}

var 
    apertouNaTela: boolean;
    falouAntes: boolean;

procedure montaMapa (umForm: TForm; meuClick: TNotifyEvent);
var
    nSensor: integer;
    pNome: array [0..2000] of char;
    pNum: array [0..3] of char;
    voz, velocidade, tom: integer;

begin
    getPrivateProfileString ('MAPAVOX', 'NOME', 'Mapa', pNome, 255, @nomeArq[1]);
    nomeMapa := pNome;

    getPrivateProfileString ('MAPAVOX', 'IMAGEM', 'x.bmp', pNome, 255, @nomeArq[1]);
    nomeArqImagem := pNome;

    getPrivateProfileString ('MAPAVOX', 'VOZ', '1', pNome, 255, @nomeArq[1]);
    voz := strToInt (strPas (pNome));

    getPrivateProfileString ('MAPAVOX', 'VELOCIDADE', '0', pNome, 255, @nomeArq[1]);
    velocidade := strToInt (strPas (pNome));

    getPrivateProfileString ('MAPAVOX', 'TOM', '0', pNome, 255, @nomeArq[1]);
    tom := strToInt (strPas (pNome));

    FormInic.directSS1.SuppressExceptions := 1;

    FormInic.directSS1.Select (voz);
    if not falouAntes then
        begin
            FormInic.DirectSS1.Speak (nomeMapa);
            falouAntes := true;
        end;
    if FormInic.DirectSS1.CurrentMode <> voz then
        begin
            FormInic.directSS1.Select (voz);
            if FormInic.DirectSS1.CurrentMode <> voz then
                showMessage ('Inicialização da voz SAPI falhou');
        end;

    FormInic.directSS1.Speed := velocidade;
    FormInic.directSS1.Pitch := tom;

    for nSensor := 1 to 32 do
        begin
             strPCopy (pNum, intToStr (nSensor));
             with vetSensores[nSensor] do
                 begin
                     getPrivateProfileString (pNum, 'NOME', '', pNome, 2000, @nomeArq[1]);
                     nome := strPas(pNome);
                     if nome = '' then continue;

                     getPrivateProfileString (pNum, 'X', '0', pNome, 255, @nomeArq[1]);
                     x := strToInt (strPas (pNome));
                     getPrivateProfileString (pNum, 'Y', '0', pNome, 255, @nomeArq[1]);
                     y := strToInt (strPas (pNome));

                     bot := TButton.create (umForm);
                     bot.Tag := nSensor;
                     bot.onClick := meuClick;
                     bot.Left := x;
                     bot.Top := y + formExibe.label1.height;
                     bot.Width := 10;
                     bot.Height := 10;
                     bot.Hint := nome;
                     bot.ShowHint := true;
                     bot.Parent := umForm;
                 end;
        end;
end;

procedure fechaMapa;
var i: integer;
begin
    for i := 1 to 32 do
        begin
            if vetSensores[i].bot <> NIL then
                begin
                    vetSensores[i].bot.visible := false;
                    vetSensores[i].bot.parent := NIL;
                    vetSensores[i].bot := NIL;
                end;
        end;
end;

procedure TformExibe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    timer1.Enabled := false;
    fechaMapa;
    action := caHide;
    formInic.Show;
//    coUninitialize;
end;

procedure TformExibe.meuClick(Sender: TObject);
var i: integer;
begin
    for i := 1 to 32 do
        vetChaves[i] := false;
    vetChaves[(sender as TButton).tag] := true;
    apertouNaTela := true;
end;

procedure TformExibe.FormActivate(Sender: TObject);
var i: integer;
begin
    falouAntes := false;
    montaMapa (self, meuClick);

    image1.Picture.LoadFromFile(nomeArqImagem);

    clientWidth := image1.Picture.Width;
    clientHeight := image1.Picture.Height+label1.height;
    label1.Caption := nomeMapa;
    application.processMessages;

    top := 0;
    left := 0;

    for i := 1 to 32 do
        vetChaves[i] := false;
    apertouNaTela := false;

    inicChaves (printerPort);
    timer1.Enabled := true;
end;

procedure TFormExibe.ativaExibicao (n: integer);
var pNome: array [0..2000] of char;
    pImagem: array [0..255] of char;
    pNumSensor, pNumMsg: array [0..10] of char;
    i: integer;
    s, img: string;
begin
    for i := 1 to 32 do
        begin
            if vetSensores[i].bot <> NIL then
                vetSensores[i].bot.visible := false;
        end;

    str (n, s);
    strPCopy (pNumSensor, s);

    getPrivateProfileString (pNumSensor, 'IMAGEM', '', pImagem, 255, @nomeArq[1]);
    img := strPas (pImagem);
    if FileExists(img) then
        image1.Picture.LoadFromFile(img);
    clientWidth := image1.Picture.Width;
    clientHeight := image1.Picture.Height + label1.height;
    application.processMessages;

    getPrivateProfileString (pNumSensor, 'NOME', '', pNome, 255, @nomeArq[1]);
    label1.caption := strPas(pNome);
    application.processMessages;

    for i := 1 to 20 do
        begin
            str (i, s);
            strPCopy (pNumMsg, s);
            getPrivateProfileString (pNumSensor, pNumMsg, '', pNome, 255, @nomeArq[1]);
            s := pNome;
            if copy (s, 1, 4) = 'SOM ' then
                begin
                    delete (s, 1, 4);
                    tocaSom (s);
                end
            else
            if copy (s, 1, 4) = 'VOZ ' then
                begin
                    delete (s, 1, 4);
                    if s <> '' then
                        begin
                            formInic.directSS1.Speak(s);
                            while formInic.directSS1.Speaking <> 0 do
                                application.ProcessMessages;
                        end;
                end
            else
            if copy (s, 1, 6) = 'ESPERA' then
                sleep (2000);
        end;

    vetChaves[n] := false;
    timer1.enabled := true;

    image1.Picture.LoadFromFile(nomeArqImagem);
    clientWidth := image1.Picture.Width;
    clientHeight := image1.Picture.Height+label1.height;
    label1.Caption := nomeMapa;

    for i := 1 to 32 do
        begin
            if vetSensores[i].bot <> NIL then
                vetSensores[i].bot.visible := true;
        end;
end;

procedure TformExibe.Timer1Timer(Sender: TObject);
var i: integer;
begin
    if apertouNaTela then
        apertouNaTela := false
    else
        obtemChaves;

    for i := 1 to 32 do
        begin
            if vetChaves[i] then
                begin
                    timer1.enabled := false;
                    ativaExibicao (i);
                    exit;
                end;
        end;
end;

procedure TformExibe.tocaSom (som: string);
begin
    MediaPlayer1.FileName := som;
    MediaPlayer1.Open;
    MediaPlayer1.Wait := true;
    MediaPlayer1.Play;
    MediaPlayer1.Close;
end;

end.
