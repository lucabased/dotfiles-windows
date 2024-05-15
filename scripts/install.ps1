# Check if the script is running with administrative privileges
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You do not have administrative rights. Please run this script as an administrator."
    Exit
}

# Check if Chocolatey is installed
if (-not (Test-Path 'C:\ProgramData\chocolatey\bin\choco.exe')) {
    # Install Chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Define a list of packages to install
$packages = @(
	# Util
    "git",
    "tor",
    "mpv",
    "open-shell",
    "firefox",
    "7zip.install",
    "notepadplusplus",
	"powertoys",
	
	# Fonts
	"firacode",
	
	# Quality of life
    "microsoft-windows-terminal",
    "ffmpeg",
    "adobereader",
	"yt-dlp",
	"spotify",

	# Backup & File sharing
    "megasync",
    "sharex",
    "winscp",
    "rufus",
	
	# Comms
    "pidgin",
    "pidgin-otr",
	"rambox",
	
	# Security
    "vmwareworkstation",
    "bitdefenderavfree",
    "keepassxc",
	"veracrypt",
	"gnupg",
	"keybase",
	
	# Development
    "postman",
    "rust",
    "vscode",
    "nodejs",
	"dbeaver",
	
	
	# Network
    "mullvad-app",
    "tor-browser",
    "openvpn" 
)

# Install each package
foreach ($package in $packages) {
    choco install $package -y
}

# Create scripts folder
$scriptsFolderName = "awesome-scripts"
$scriptsFolderPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Desktop"), $scriptsFolderName)

# Create if not existant
if (-not (Test-Path $scriptsFolderPath)) {
    New-Item -ItemType Directory -Path $scriptsFolderPath | Out-Null
}

# Move cursor
Set-Location $folderPath

# Clone the scripts 
git clone https://github.com/massgravel/Microsoft-Activation-Scripts


