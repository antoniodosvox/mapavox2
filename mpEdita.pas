unit mpEdita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TformEdita = class(TForm)
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure meuClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  formEdita: TformEdita;

implementation

uses mpInic, mpVars, mpEntraDados, mpSons, mpExibe;
{$R *.dfm}

procedure TformEdita.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    action := caHide;
    fechaMapa;
    formInic.Show;
end;

procedure TformEdita.FormActivate(Sender: TObject);
begin
    clientWidth := 200;
    clientHeight := 0;
    top := screen.height div 2;
    left := screen.width div 2 - 100;
    caption := 'Mapavox';

    formDados.showModal;

    montaMapa (self, meuClick);

    image1.Picture.LoadFromFile(nomeArqImagem);
    caption := nomeMapa;

    top := 0;
    left := 0;
    clientWidth := image1.Width;
    clientHeight := image1.Height;
end;

procedure TformEdita.meuClick(Sender: TObject);
var nSensor: integer;
begin
    nSensor := (sender as TButton).tag;
    formSons.e_nSensor.Text := intToStr(nSensor);
    formSons.showModal;

    fechaMapa;
    montaMapa(self, meuClick);
end;

procedure TformEdita.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    formSons.e_nSensor.Text := '';
    novox := x;
    novoy := y;
    formSons.showModal;
    fechaMapa;
    montaMapa(self, meuClick);
end;

end.
