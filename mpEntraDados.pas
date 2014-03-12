unit mpEntraDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, mpVars, mpInic;

type
  TformDados = class(TForm)
    e_nomeMapa: TEdit;
    e_nomeImagem: TEdit;
    e_voz: TEdit;
    e_veloc: TEdit;
    e_tom: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    b_ok: TButton;
    b_procurar: TButton;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    procedure b_okClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure b_procurarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formDados: TformDados;

implementation

{$R *.dfm}

procedure TformDados.b_okClick(Sender: TObject);
var s: string;
begin
    s := e_nomeMapa.text;
    WritePrivateProfileString ('MAPAVOX', 'NOME', @s[1], @nomeArq[1]);
    s := e_nomeImagem.Text;
    WritePrivateProfileString ('MAPAVOX', 'IMAGEM', @s[1], @nomeArq[1]);
    s := e_voz.Text;
    WritePrivateProfileString ('MAPAVOX', 'VOZ', @s[1], @nomeArq[1]);
    s := e_veloc.Text;
    writePrivateProfileString ('MAPAVOX', 'VELOCIDADE', @s[1], @nomeArq[1]);
    s := e_tom.Text;
    writePrivateProfileString ('MAPAVOX', 'TOM', @s[1], @nomeArq[1]);

    close;
end;

procedure TformDados.FormActivate(Sender: TObject);
var
   pNome: array [0..255] of char;
begin
    getPrivateProfileString ('MAPAVOX', 'NOME', 'Mapa', pNome, 255, @nomeArq[1]);
    e_nomeMapa.Text := pnome;

    getPrivateProfileString ('MAPAVOX', 'IMAGEM', 'x.bmp', pNome, 255, @nomeArq[1]);
    e_nomeImagem.Text := pnome;

    getPrivateProfileString ('MAPAVOX', 'VOZ', '1', pNome, 255, @nomeArq[1]);
    e_voz.Text := pnome;

    getPrivateProfileString ('MAPAVOX', 'VELOCIDADE', '0', pNome, 255, @nomeArq[1]);
    e_veloc.Text := pnome;

    getPrivateProfileString ('MAPAVOX', 'TOM', '0', pNome, 255, @nomeArq[1]);
    e_tom.Text := pnome;
end;

procedure TformDados.b_procurarClick(Sender: TObject);
begin
    if OpenDialog1.Execute then
         e_nomeImagem.text := OpenDialog1.FileName;
end;

procedure TformDados.Button1Click(Sender: TObject);
var voz: integer;
begin
    FormInic.directSS1.SuppressExceptions := 1;

    voz := strToInt (e_voz.Text);
    FormInic.directSS1.Select (voz);
    if FormInic.DirectSS1.CurrentMode <> voz then
        begin
            FormInic.directSS1.Select (voz);
            if FormInic.DirectSS1.CurrentMode <> voz then
                showMessage ('Inicialização da voz SAPI falhou');
        end;

    FormInic.directSS1.Speed := strToInt (e_veloc.Text);
    FormInic.directSS1.Pitch := strToInt (e_tom.Text);
    FormInic.DirectSS1.Speak('Este é um teste das características da voz sintetizada');
end;

end.
