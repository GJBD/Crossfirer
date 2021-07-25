; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppID "1729353B-4A53-489D-9DE7-34F75512CB74"
#define MyAppName "神经自瞄"
#define MyAppName_std "神经自瞄标准版"
#define MyAppName_ex "神经自瞄备用版"
#define MyAppVersion "2.5.5"
#define MyAppPublisher "名侦探柯南战队"
#define MyAppURL "https://space.bilibili.com/637136569"
#define MyAppExeName1 "AI_M_BOT_X1.exe"
#define MyAppExeName2 "AI_M_BOT_X2.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={#MyAppID}
AppMutex={#MyAppName} {#MyAppID}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
ArchitecturesInstallIn64BitMode=x64
DefaultDirName=D:\Program Files\AI-M-BOT
DisableProgramGroupPage=yes
DisableDirPage=auto
LicenseFile=.\Neurotic AImbot\LICENSE.txt
InfoAfterFile=.\Neurotic AImbot\使用说明.rtf
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=.
OutputBaseFilename=神经自瞄更新{#MyAppVersion}
SetupIconFile=.\Logo\AI-M-BOT1.ico
Password=名侦探柯南战队出品
Encryption=yes
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
VersionInfoVersion={#MyAppVersion}.0

[Languages]
Name: "chinesesimplified"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: ".\_AImbot_\{#MyAppExeName1}"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\_AImbot_\{#MyAppExeName2}"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\_AImbot_\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName_std}"; Filename: "{app}\{#MyAppExeName1}"; WorkingDir: "{app}"
Name: "{autoprograms}\{#MyAppName_ex}"; Filename: "{app}\{#MyAppExeName2}"; WorkingDir: "{app}"
Name: "{autodesktop}\{#MyAppName_std}"; Filename: "{app}\{#MyAppExeName1}"; Tasks: desktopicon; WorkingDir: "{app}"
Name: "{autodesktop}\{#MyAppName_ex}"; Filename: "{app}\{#MyAppExeName2}"; Tasks: desktopicon; WorkingDir: "{app}"

[Code]
function IsAppInstalled: boolean;
begin
    result := RegValueExists(HKEY_LOCAL_MACHINE,'Software\Microsoft\Windows\CurrentVersion\Uninstall\{#MyAppID}_is1', 'DisplayVersion');
end;

function InitializeSetup: boolean;
begin
    result := IsAppInstalled;
        if not result then
            MsgBox('你需要安装好完整版神经自瞄后方能使用本更新包.', mbError, MB_OK);
end;
