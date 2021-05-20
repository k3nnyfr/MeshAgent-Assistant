#define MyAppName "MeshAgent-Assistant"
#define MyAppVersion "1.0"
#define MyAppPublisher "CHANGEIT"
#define MyAppURL "https://mesh.server.fr"
#define Mesh_exe_64 "meshagent64.exe"
#define Mesh_exe_32 "meshagent32.exe"
#define MeshAssistant "MeshCentralAssistant.exe"
#define MeshIcon "MeshServer.ico"

[Setup]
AppId={{6A04B7B1-73F9-4FC6-9C40-8CB8E18D4251}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={commonpf64}\Mesh Agent
DefaultGroupName=Mesh Agent
PrivilegesRequiredOverridesAllowed=commandline
OutputDir={#SourcePath}
OutputBaseFilename={#MyAppName}_x64_x32
SetupIconFile={#SourcePath}\{#MeshIcon}
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
UninstallDisplayIcon={app}\{#MeshIcon}
UninstallDisplayName={#MyAppName}
LanguageDetectionMethod=uilanguage
ShowLanguageDialog=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "fr"; MessagesFile: "compiler:Languages\French.isl"

[Files]
Source: "{#SourcePath}\{#Mesh_exe_64}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}\{#Mesh_exe_32}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}\{#MeshAssistant}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}\{#MeshIcon}"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\MeshCentralAssistant"; Filename: "{app}\{#MeshAssistant}"
Name: "{commonstartup}\MeshCentralAssistant"; Filename: "{app}\{#MeshAssistant}"

[Run]
Filename: "{app}\{#Mesh_exe_64}"; Parameters: "-fullinstall"; Check: Is64BitInstallMode; \
  StatusMsg: "Installating MeshAgent and MeshAssistant"; Description: "Installating MeshAgent and MeshAssistant"; \
  Flags: skipifdoesntexist runhidden
Filename: "{app}\{#Mesh_exe_32}"; Parameters: "-fullinstall"; Check: not Is64BitInstallMode; \
  StatusMsg: "Installating MeshAgent and MeshAssistant"; Description: "Installating MeshAgent and MeshAssistant"; \
  Flags: skipifdoesntexist runhidden
Filename: "{app}\{#MeshAssistant}"; Description: "Launch MeshAssistant"; Flags: nowait postinstall skipifsilent 

