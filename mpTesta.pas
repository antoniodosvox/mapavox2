unit mpTesta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TformTeste = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox31: TCheckBox;
    CheckBox32: TCheckBox;
    Timer1: TTimer;
    r_porta_lpt: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure r_porta_lptClick(Sender: TObject);
  private
    { Private declarations }
    procedure refreshChaves;
  public
    { Public declarations }
  end;

var
  formTeste: TformTeste;

implementation

uses mpInic, mpChaves, mpVars;

{$R *.dfm}

procedure TformTeste.refreshChaves;
begin
    inicChaves(printerPort);
    obtemChaves;
    CheckBox1.Checked := vetChaves[1];
    CheckBox2.Checked := vetChaves[2];
    CheckBox3.Checked := vetChaves[3];
    CheckBox4.Checked := vetChaves[4];
    CheckBox5.Checked := vetChaves[5];
    CheckBox6.Checked := vetChaves[6];
    CheckBox7.Checked := vetChaves[7];
    CheckBox8.Checked := vetChaves[8];
    CheckBox9.Checked := vetChaves[9];
    CheckBox10.Checked := vetChaves[10];
    CheckBox11.Checked := vetChaves[11];
    CheckBox12.Checked := vetChaves[12];
    CheckBox13.Checked := vetChaves[13];
    CheckBox14.Checked := vetChaves[14];
    CheckBox15.Checked := vetChaves[15];
    CheckBox16.Checked := vetChaves[16];
    CheckBox17.Checked := vetChaves[17];
    CheckBox18.Checked := vetChaves[18];
    CheckBox19.Checked := vetChaves[19];
    CheckBox20.Checked := vetChaves[20];
    CheckBox21.Checked := vetChaves[21];
    CheckBox22.Checked := vetChaves[22];
    CheckBox23.Checked := vetChaves[23];
    CheckBox24.Checked := vetChaves[24];
    CheckBox25.Checked := vetChaves[25];
    CheckBox26.Checked := vetChaves[26];
    CheckBox27.Checked := vetChaves[27];
    CheckBox28.Checked := vetChaves[28];
    CheckBox29.Checked := vetChaves[29];
    CheckBox30.Checked := vetChaves[30];
    CheckBox31.Checked := vetChaves[31];
    CheckBox32.Checked := vetChaves[32];
end;

procedure TformTeste.FormActivate(Sender: TObject);
begin
    timer1.Enabled := true;
end;

procedure TformTeste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    action := caHide;
    timer1.Enabled := false;
    formInic.show;
end;

procedure TformTeste.Timer1Timer(Sender: TObject);
begin
    refreshChaves;
end;

procedure TformTeste.FormShow(Sender: TObject);
begin
    r_porta_lpt.ItemIndex := printerPort - 1;
end;

var lpt: string;
procedure TformTeste.r_porta_lptClick(Sender: TObject);
begin
    printerPort := r_porta_lpt.ItemIndex + 1;
    lpt := intToStr (printerPort);
    WritePrivateProfileString('MAPAVOX', 'PRINTER', @lpt[1], @inifile[1]);
end;

end.
