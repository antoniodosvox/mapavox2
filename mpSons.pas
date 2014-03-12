unit mpSons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, mmSystem;

type
  TformSons = class(TForm)
    label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    e_nome: TEdit;
    e_x: TEdit;
    e_y: TEdit;
    ListBox1: TListBox;
    b_novoSom: TButton;
    b_removeTudo: TButton;
    b_novaVoz: TButton;
    b_removeSom: TButton;
    b_ok: TButton;
    Label4: TLabel;
    e_nSensor: TEdit;
    b_executa: TButton;
    sb_up: TSpeedButton;
    sb_down: TSpeedButton;
    OpenDialog1: TOpenDialog;
    b_cancela: TButton;
    b_edita: TButton;
    Label5: TLabel;
    e_imagem: TEdit;
    b_procurar: TButton;
    OpenDialog2: TOpenDialog;
    b_espera: TButton;
    procedure FormActivate(Sender: TObject);
    procedure b_removeTudoClick(Sender: TObject);
    procedure b_novoSomClick(Sender: TObject);
    procedure b_novaVozClick(Sender: TObject);
    procedure b_removeSomClick(Sender: TObject);
    procedure sb_upClick(Sender: TObject);
    procedure sb_downClick(Sender: TObject);
    procedure b_cancelaClick(Sender: TObject);
    procedure b_executaClick(Sender: TObject);
    procedure b_okClick(Sender: TObject);
    procedure b_editaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure b_procurarClick(Sender: TObject);
    procedure b_esperaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSons: TformSons;

implementation

uses mpVars, mpInic, mpExibe;
{$R *.dfm}

procedure apagaSensor (nSensor: integer);
var s: string;
begin
    s := intToStr (nSensor);
    WritePrivateProfileString(@s[1], NIL, NIL, @nomeArq[1]);
end;

procedure TformSons.FormActivate(Sender: TObject);
var
    pNome: array [0..255] of char;
    pNum, pSom: array [0..10] of char;
    i: integer;
begin
    strPCopy (pNum, e_nSensor.text);
    e_nome.text := '';
    e_x.text := intToStr (novox);
    e_y.text := intToStr (novoy);

    if e_nSensor.text = '' then exit;

    getPrivateProfileString (pNum, 'NOME', '', pNome, 255, @nomeArq[1]);
    e_nome.text := pNome;
    getPrivateProfileString (pNum, 'X', '0', pNome, 255, @nomeArq[1]);
    e_x.text := pNome;
    getPrivateProfileString (pNum, 'Y', '0', pNome, 255, @nomeArq[1]);
    e_y.text := pNome;
    getPrivateProfileString (pNum, 'IMAGEM', '0', pNome, 255, @nomeArq[1]);
    e_imagem.text := pNome;

    ListBox1.clear;
    for i := 1 to 10 do
        begin
            strPCopy (pSom, intToStr(i));
            getPrivateProfileString (pNum, pSom, '', pNome, 255, @nomeArq[1]);
            if strPas(pNome) <> '' then
                ListBox1.Items.Add(strPas(pNome));
        end;
end;

procedure TformSons.b_removeTudoClick(Sender: TObject);
var nSensor: integer;
begin
    try
        nSensor := strToInt (e_nSensor.text);
    except
        showMessage ('Número de sensor inválido');
        exit;
    end;

    if  MessageDlg('Quer mesmo remover o sensor ' + e_nSensor.text + ' ?',
        mtConfirmation, [mbOk, mbCancel], 0) = mrCancel then
             exit;

    apagaSensor (nSensor);
    close;
end;

procedure TformSons.b_novoSomClick(Sender: TObject);
begin
    if openDialog1.execute then
        listBox1.Items.add ('SOM ' + openDialog1.filename);
end;

procedure TformSons.b_novaVozClick(Sender: TObject);
var s: string;
begin
    inputQuery ('Nova fala a adicionar', 'Voz', s);
    if s <> '' then
        listBox1.Items.add ('VOZ ' + s);
end;

procedure TformSons.b_removeSomClick(Sender: TObject);
begin
    listBox1.deleteSelected;
end;

procedure TformSons.sb_upClick(Sender: TObject);
var i: integer;
    s: string;
begin
    i := ListBox1.ItemIndex;
    if i <= 0 then exit;
    s := listBox1.items[i];
    ListBox1.Items.Delete(i);

    i := i - 1;
    ListBox1.Items.insert (i, s);
    ListBox1.itemIndex := i;
end;

procedure TformSons.sb_downClick(Sender: TObject);
var i: integer;
    s: string;
begin
    i := ListBox1.ItemIndex;
    if (i = ListBox1.count-1) or (i < 0) then exit;

    s := listBox1.items[i];
    ListBox1.Items.Delete(i);

    i := i + 1;
    ListBox1.Items.insert (i, s);
    ListBox1.itemIndex := i;
end;

procedure TformSons.b_cancelaClick(Sender: TObject);
begin
   close;
end;

procedure TformSons.b_executaClick(Sender: TObject);
var i: integer;
    s: string;
begin
    for i := 0 to listBox1.count-1 do
        begin
            listBox1.ItemIndex := i;
            s := ListBox1.items[i];
            if copy (s, 1, 4) = 'SOM ' then
                begin
                    delete (s, 1, 4);
                    formExibe.tocaSom (s);
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
end;

procedure TformSons.b_okClick(Sender: TObject);
var i: integer;
    s: string;
    pNome: array [0..2000] of char;
    p_nSensor, pn: array [0..5] of char;
    ok: boolean;
begin
    s := e_nSensor.text;
    strPCopy (p_nSensor, e_nSensor.text);

    ok := length (s) <> 0;
    for i := 1 to length (s) do
        if not (s[i] in ['0'..'9']) then ok := false;

    if not ok then
        begin
            if  MessageDlg('Sensor inválido, não vou gravar',
                       mtConfirmation, [mbOk, mbCancel], 0) = mrOk then
                close;
        end
    else
        begin
            WritePrivateProfileString(p_nSensor, NIL, NIL, @nomeArq[1]);

            strPCopy (pNome, e_nome.text);
            WritePrivateProfileString(p_nSensor, 'NOME', pNome, @nomeArq[1]);
            strPCopy (pNome, e_x.text);
            WritePrivateProfileString(p_nSensor, 'X', pNome, @nomeArq[1]);
            strPCopy (pNome, e_y.text);
            WritePrivateProfileString(p_nSensor, 'Y', pNome, @nomeArq[1]);
            strPCopy (pNome, e_imagem.text);
            WritePrivateProfileString(p_nSensor, 'IMAGEM', pNome, @nomeArq[1]);

            for i := 0 to listBox1.count-1 do
                begin
                    s := ListBox1.items[i];
                    strPCopy (pn, intToStr (i+1));
                    if s <> '' then
                        WritePrivateProfileString(p_nSensor, pn, @s[1], @nomeArq[1]);
                end;
            close;
    end;
end;

procedure TformSons.b_editaClick(Sender: TObject);
var i: integer;
    s: string;
begin
    i := ListBox1.ItemIndex;
    if i < 0 then exit;

    s := listBox1.items[i];
    if InputQuery('Edite', 'Informação alterada', s) then
    listBox1.items[i] := s;
end;

procedure TformSons.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    action := caHide;
end;

procedure TformSons.b_procurarClick(Sender: TObject);
begin
   if OpenDialog2.Execute then
       e_imagem.text := openDialog2.filename;
end;

procedure TformSons.b_esperaClick(Sender: TObject);
begin
    listBox1.Items.add ('ESPERA');
end;

end.
