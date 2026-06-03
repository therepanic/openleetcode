$ErrorActionPreference = "Stop"

$REPO = "therepanic/openleetcode"
$BIN_NAME = "openleetcode"
$INSTALL_DIR = "$env:LOCALAPPDATA\Programs\openleetcode"

if ($Host.UI.RawUI -and !$env:NO_COLOR) {
    $ESC = [char]27
    $CYAN = "${ESC}[1;36m"
    $GREEN = "${ESC}[32m"
    $RED = "${ESC}[31m"
    $DIM = "${ESC}[2m"
    $RESET = "${ESC}[0m"
}
else {
    $CYAN = ""
    $GREEN = ""
    $RED = ""
    $DIM = ""
    $RESET = ""
}

function banner {
    $lines = @(
        " ▄▄▄  ▄▄▄▄  ▄▄▄▄▄ ▄▄  ▄▄ ▄▄    ▄▄▄▄▄ ▄▄▄▄▄ ▄▄▄▄▄▄ ▄▄▄▄  ▄▄▄  ▄▄▄▄  ▄▄▄▄▄"
        "██▀██ ██▄█▀ ██▄▄  ███▄██ ██    ██▄▄  ██▄▄    ██  ██▀▀▀ ██▀██ ██▀██ ██▄▄"
        "▀███▀ ██    ██▄▄▄ ██ ▀██ ██▄▄▄ ██▄▄▄ ██▄▄▄   ██  ▀████ ▀███▀ ████▀ ██▄▄▄"
    )

    foreach ($line in $lines) {
        Write-Host "${CYAN}${line}${RESET}"
    }

    Write-Host ""
}

function info ($msg) {
    Write-Host "${CYAN}›${RESET} $msg"
}

function success ($msg) {
    Write-Host "${GREEN}✓${RESET} $msg"
}

function error ($msg) {
    Write-Host "${RED}✗${RESET} $msg"
}

banner
info "Installing $BIN_NAME..."

$arch = $env:PROCESSOR_ARCHITECTURE

switch ($arch) {
    "AMD64" { $arch_name = "amd64" }
    "ARM64" { $arch_name = "arm64" }
    default {
        error "Unsupported architecture: $arch"
        exit 1
    }
}

$asset = "${BIN_NAME}-windows-${arch_name}.exe"
$url = "https://github.com/${REPO}/releases/latest/download/${asset}"

$tmp = Join-Path ([System.IO.Path]::GetTempPath()) "${BIN_NAME}.exe"

info "Detected target: windows-$arch_name"
info "Downloading latest release..."

curl.exe -fsSL $url -o $tmp

if (!(Test-Path $INSTALL_DIR)) {
    New-Item -ItemType Directory -Force -Path $INSTALL_DIR | Out-Null
}

$dest = Join-Path $INSTALL_DIR "${BIN_NAME}.exe"

info "Installing as $dest"

Copy-Item -Path $tmp -Destination $dest -Force
Remove-Item $tmp -Force

$userPath = [Environment]::GetEnvironmentVariable("Path", "User")

if ($userPath -notlike "*$INSTALL_DIR*") {
    [Environment]::SetEnvironmentVariable(
        "Path",
        "$userPath;$INSTALL_DIR",
        "User"
    )
    $env:Path = "$env:Path;$INSTALL_DIR"
}

success "Installed successfully!"
success "Run: $BIN_NAME"
