;--allSnap Install

[Setup]
OutputBaseFilename=allsnap-setup-v1.60-arm64
AllowNoIcons=yes
AppName=allSnap
AppVerName=allSnap version 1.60 - ARM64
AppMutex=IVAN_HECKMAN_ALLSNAP_MUTEX,IVAN_HECKMAN_ALLSNAP_MUTEXB
AppCopyright=Copyright © 2002 Ivan Heckman; 2025 Anthony Lieuallen
AppPublisher=
AppPublisherURL=
AppUpdatesURL=
AppVersion=1.60
ArchitecturesAllowed=ARM64
DefaultDirName={commonpf}\allSnap
ArchitecturesInstallIn64BitMode=ARM64
DefaultGroupName=allSnap
UninstallDisplayIcon={app}\allSnap.exe
LicenseFile=..\LICENSE
MinVersion=10.0
SetupIconFile=snapit.ico
SolidCompression=yes
UsedUserAreasWarning=no
VersionInfoVersion=2026.03.07.01

[Types]
Name: typical; Description: Typical install, best for most users.
Name: full; Description: Full install including all optional parts.
Name: minimal; Description: The minimum possible set of parts.
Name: custom; Description: Choose which parts to install.; Flags: iscustom


[Components]
Name: bin; Description: Base program; Types: typical full minimal custom; Flags: fixed
Name: bin\x64; Description: 64-bit version; Types: full
Name: bin\x86; Description: 32-bit version; Types: full
Name: help; Description: Help file; Types: typical full custom
Name: sounds; Description: Default sound files; Types: typical full


[Files]
Source: "ARM64\Release UNICODE\allSnap.exe"; DestDir: "{app}"; Components: bin
Source: "ARM64\Release UNICODE\snap_lib.dll"; DestDir: "{app}"; Components: bin
Source: "x64\Release UNICODE\allSnap_x64.exe"; DestDir: "{app}"; Components: bin\x64
Source: "x64\Release UNICODE\snap_lib_x64.dll"; DestDir: "{app}"; Components: bin\x64
Source: "Win32\Release UNICODE\allSnap_x86.exe"; DestDir: "{app}"; Components: bin\x86
Source: "Win32\Release UNICODE\snap_lib_x86.dll"; DestDir: "{app}"; Components: bin\x86
Source: "snap.wav"; DestDir: "{app}"; Components: sounds
Source: "unsnap.wav"; DestDir: "{app}"; Components: sounds
Source: "..\help\allSnap.chm"; DestDir: "{app}"; Components: help


[Tasks]
Name: startup; Description: "Run allSnap on &startup"
Name: desktopicon; Description: "Create a &desktop icon"; Flags: unchecked


[Icons]
Name: "{group}\allSnap"; Filename: "{app}\allSnap.exe"; WorkingDir: "{app}"
Name: "{group}\allSnap Help"; Filename: "{app}\allSnap.chm"; WorkingDir: "{app}"; Components: help
Name: "{userdesktop}\allSnap"; Filename: "{app}\allSnap.exe"; WorkingDir: "{app}"; Tasks: desktopicon
Name: "{userstartup}\allSnap"; Filename: "{app}\allSnap.exe"; WorkingDir: "{app}"; Tasks: startup
Name: "{userstartup}\allSnapx64"; Filename: "{app}\allSnap_x64.exe"; WorkingDir: "{app}"; Tasks: startup; Components: bin\x64
Name: "{userstartup}\allSnapx86"; Filename: "{app}\allSnap_x86.exe"; WorkingDir: "{app}"; Tasks: startup; Components: bin\x86


[Registry]
Root: HKCU; Subkey: "Software\IvanHeckman"; Flags: uninsdeletekeyifempty
Root: HKCU; Subkey: "Software\IvanHeckman\allSnap"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\IvanHeckman\allSnap\Settings"; ValueType: string; ValueName: "snap_sound_file"; ValueData: "{app}\snap.wav"; Components: sounds
Root: HKCU; Subkey: "Software\IvanHeckman\allSnap\Settings"; ValueType: string; ValueName: "unsnap_sound_file"; ValueData: "{app}\unsnap.wav"; Components: sounds


[Run]
Filename: "{app}\allSnap.exe"; Description: "Launch application (ARM64)"; Flags: postinstall nowait skipifsilent
Filename: "{app}\allSnap_x64.exe"; Description: "Launch application (64-bit)"; Flags: postinstall nowait skipifsilent; Components: bin\x64
Filename: "{app}\allSnap_x86.exe"; Description: "Launch application (32-bit)"; Flags: postinstall nowait skipifsilent; Components: bin\x86
