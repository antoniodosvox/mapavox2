program mapavox;

uses
  Forms,
  mpInic in 'mpInic.pas' {FormInic},
  mpAutores in 'mpAutores.pas' {formAutores},
  mpEdita in 'mpEdita.pas' {formEdita},
  mpExibe in 'mpExibe.pas' {formExibe},
  mpVars in 'mpVars.pas',
  mpChaves in 'mpChaves.pas',
  mpTesta in 'mpTesta.pas' {formTeste},
  mpEntraDados in 'mpEntraDados.pas' {formDados},
  mpSons in 'mpSons.pas' {formSons};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Mapavox';
  Application.CreateForm(TFormInic, FormInic);
  Application.CreateForm(TformAutores, formAutores);
  Application.CreateForm(TformEdita, formEdita);
  Application.CreateForm(TformExibe, formExibe);
  Application.CreateForm(TformTeste, formTeste);
  Application.CreateForm(TformDados, formDados);
  Application.CreateForm(TformSons, formSons);
  Application.Run;
end.
