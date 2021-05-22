#define MyAppName "MeshAgent-Assistant"
#define MyAppVersion "1.0"
#define MyAppPublisher "CHANGEIT"
#define MyAppURL "https://mesh.server.fr"
#define Mesh_exe_64 "meshagent64.exe"
#define Mesh_exe_32 "meshagent32.exe"
#define MeshAssistant "MeshCentralAssistant.exe"
#define MeshIcon "MeshServer.ico"
#define MeshLogo "meshcental-logo.bmp"
#define MeshLogoSmall "meshcental-logo-small.bmp"
#define MeshRouter "MeshCentralRouter.exe"

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
DisableWelcomePage=no
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
WizardImageFile="{#SourcePath}\{#MeshLogo}"
WizardSmallImageFile="{#SourcePath}\{#MeshLogoSmall}"

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "fr"; MessagesFile: "compiler:Languages\French.isl"

[CustomMessages]
WelcomeLabel3=About MeshCentral :%n%nMeshCentral is a full computer management web site with full web-based%nremote desktop, terminal and file management capability.

[Messages]
WelcomeLabel1=MeshAgent-Assistant Setup Wizard
WelcomeLabel2=This will install [name/ver] for MeshCentral.%n%nIt is recommended that you close all other applications before continuing.%n
SetupWindowTitle=MeshAgent-Assistant Setup Wizard - {#MyAppVersion}

[Types]
Name: "typical"; Description: "Typical installation";
Name: "full"; Description: "Full installation";
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "application"; Description: "Application"
Name: "application\app";      Description: "MeshAgent";                 Types: full typical custom; Flags: fixed
Name: "application\assistant";   Description: "MeshCentralAssistant";   Types: full typical custom;
Name: "application\router";     Description: "MeshRouter";              Types: full custom;
Name: "icons"; Description: "Icons"
Name: "icons\startup";     Description: "Create Startup icons";              Types: full typical custom; Flags: fixed
Name: "icons\startmenuicons";     Description: "Create StartMenu icons";     Types: full typical custom;
Name: "icons\desktopicons";     Description: "Create Desktop icons";         Types: full custom;

[Files]
Source: "{#SourcePath}\{#Mesh_exe_64}"; DestDir: "{app}"; Flags: ignoreversion; Components: application\app
Source: "{#SourcePath}\{#Mesh_exe_32}"; DestDir: "{app}"; Flags: ignoreversion; Components: application\app
Source: "{#SourcePath}\{#MeshAssistant}"; DestDir: "{app}"; Flags: ignoreversion; Components: application\assistant
Source: "{#SourcePath}\{#MeshRouter}"; DestDir: "{app}"; Flags: ignoreversion; Components: application\router
Source: "{#SourcePath}\{#MeshIcon}"; DestDir: "{app}"; Flags: ignoreversion; Components: application\app

[Icons]
// Startup
Name: "{commonstartup}\MeshCentralAssistant"; Filename: "{app}\{#MeshAssistant}"; Components: application\assistant and icons\startup;
// StartMenu
Name: "{group}\MeshCentralAssistant"; Filename: "{app}\{#MeshAssistant}"; Components: application\app and icons\startmenuicons;
Name: "{group}\MeshCentralRouter"; Filename: "{app}\{#MeshRouter}"; Components: application\router and icons\startmenuicons;
// Desktop
Name: "{commondesktop}\MeshCentralRouter"; Filename: "{app}\{#MeshRouter}"; Components: application\router and icons\desktopicons;
Name: "{commondesktop}\MeshCentralAssistant"; Filename: "{app}\{#MeshAssistant}"; Components: application\assistant and icons\desktopicons;

[Run]
Filename: "{app}\{#Mesh_exe_64}"; Parameters: "-fullinstall"; Check: Is64BitInstallMode; \
  StatusMsg: "Installating MeshAgent and MeshAssistant"; Description: "Installating MeshAgent x64"; \
  Flags: skipifdoesntexist runhidden
Filename: "{app}\{#Mesh_exe_32}"; Parameters: "-fullinstall"; Check: not Is64BitInstallMode; \
  StatusMsg: "Installating MeshAgent and MeshAssistant"; Description: "Installating MeshAgent x86"; \
  Flags: skipifdoesntexist runhidden
Filename: "{app}\{#MeshAssistant}"; Description: "Launch MeshAssistant"; Flags: nowait postinstall skipifsilent 

[Code]
var
  WelcomeLabel3: TNewStaticText;

procedure InitializeWizard;
begin
  WizardForm.WelcomeLabel2.AutoSize := True;

  WelcomeLabel3 := TNewStaticText.Create(WizardForm);
  WelcomeLabel3.Parent := WizardForm.WelcomePage;
  WelcomeLabel3.AutoSize := False;
  WelcomeLabel3.Left := WizardForm.WelcomeLabel2.Left;
  WelcomeLabel3.Top := WizardForm.WelcomeLabel2.Top +
    WizardForm.WelcomeLabel2.Height;
  WelcomeLabel3.Width := WizardForm.WelcomeLabel2.Width;
  WelcomeLabel3.Height := WizardForm.WelcomePage.Height - WelcomeLabel3.Top;
  WelcomeLabel3.Font.Assign(WizardForm.WelcomeLabel2.Font);
  WelcomeLabel3.Caption := CustomMessage('WelcomeLabel3');

  //WizardForm.WelcomeLabel1.Color := clYellow;
  //WizardForm.WelcomeLabel2.Color := $000080FF;
  //WelcomeLabel3.Color := clRed;
end;

