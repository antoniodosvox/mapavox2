unit mpVars;

interface
uses stdCtrls;

type
    TSensor = record
        nome: string;
        x, y: integer;
        bot: TButton;
    end;

var
    nomeArq, nomeArqImagem: string;
    nomeMapa: string;

    vetChaves: array [1..32] of boolean;
    vetSensores: array [1..32] of TSensor;

    novox, novoy: integer;
    chavesInibidas: boolean;
    printerPort: integer;
    inifile: string;

implementation

end.
