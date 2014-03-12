; -- Sample1.iss --
; Demonstrates copying 3 files and creating an icon.

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!

[Setup]
OutputBaseFilename=setupMapavox
AppName=Mapavox
AppVerName=Mapavox v.1.3
DefaultDirName=c:\mapavox
DefaultGroupName=Mapavox
UninstallDisplayIcon={app}\mapavox.exe
DisableDirPage=no
DisableProgramGroupPage=no

[Languages]
Name: PTB; MessagesFile: compiler:Languages\BrazilianPortuguese.isl

[Files]
Source: "Mapavox.exe"; DestDir: "{app}"
Source: "inpout32.dll"; DestDir: "{sys}"; Flags: onlyifdoesntexist uninsneveruninstall
Source: "spchapi.exe"; DestDir: "{app}"
Source: "lhttsptb.exe"; DestDir: "{app}"
Source: "Mapavox.txt"; DestDir: "{app}"; Flags: isreadme
Source: "mapavox.mvx"; DestDir: "{app}"; Flags: onlyifdoesntexist
Source: "mapalago.jpg"; DestDir: "{app}"; Flags: onlyifdoesntexist

[Icons]
Name: "{group}\Mapavox"; Filename: "{app}\Mapavox.exe"
Name: "{group}\Texto sobre o Mapavox"; Filename: "{app}\Mapavox.txt"
Name: "{userdesktop}\Mapavox 1.3"; Filename: "{app}\Mapavox.exe"; WorkingDir: "{app}"

[Run]
Filename: "{app}\SPCHAPI.EXE"; Description: "Install SAPI 4.0"
Filename: "{app}\LHTTSPTB.EXE"; Description: "Install L&H portuguese synthesizer"

