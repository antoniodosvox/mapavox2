unit mpInic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, activex, OleCtrls,
  ACTIVEVOICEPROJECTLib_TLB;

type
  TFormInic = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    b_autores: TButton;
    b_editarMapa: TButton;
    b_exibirMapa: TButton;
    OpenDialog1: TOpenDialog;
    b_sensores: TButton;
    DirectSS1: TDirectSS;
    cb_inibeSensores: TCheckBox;
    procedure b_autoresClick(Sender: TObject);
    procedure b_exibirMapaClick(Sender: TObject);
    procedure b_editarMapaClick(Sender: TObject);
    procedure b_sensoresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cb_inibeSensoresClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInic: TFormInic;

implementation

uses mpAutores, mpEdita, mpExibe, mpVars, mpTesta, mpChaves;

{$R *.dfm}

procedure TFormInic.b_autoresClick(Sender: TObject);
begin
    formAutores.show;
end;

procedure TFormInic.b_exibirMapaClick(Sender: TObject);
begin
    if openDialog1.Execute then
        begin
            nomeArq := OpenDialog1.FileName;
            hide;
            formExibe.show;
        end;
end;

procedure TFormInic.b_editarMapaClick(Sender: TObject);
begin
    if openDialog1.Execute then
        begin
            nomeArq := OpenDialog1.FileName;
            hide;
            formEdita.show;
        end;
end;

procedure TFormInic.b_sensoresClick(Sender: TObject);
begin
    hide;
    formTeste.show;
end;

procedure TFormInic.FormCreate(Sender: TObject);
begin
   CoInitialize(NIL);

   getDir (0, inifile);
   if inifile [length(inifile)] <> '\' then
       inifile := inifile + '\';
   inifile := inifile + 'mapavox.ini';

   printerPort := GetPrivateProfileInt('MAPAVOX', 'PRINTER', 1, @inifile[1]);
   if (printerPort < 1) or (printerPort > 3) then
       printerPort := 1;

   DirectSS1.Initialized := 1;
   directSS1.speak (' ');
end;

procedure TFormInic.cb_inibeSensoresClick(Sender: TObject);
begin
    chavesInibidas := cb_inibeSensores.Checked;
end;

procedure TFormInic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    fimChaves;
    DirectSS1.Initialized := 0;
end;

end.
