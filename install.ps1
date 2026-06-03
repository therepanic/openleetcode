$ErrorActionPreference = "Stop"

$REPO = "therepanic/openleetcode"
$BIN_NAME = "openleetcode"
$INSTALL_DIR = "$env:LOCALAPPDATA\Programs\openleetcode"

if ($Host.UI.RawUI -and !$env:NO_COLOR) {
    $ESC = [char]27
    $GRAY = "${ESC}[38;2;179;179;179m"
    $ORANGE = "${ESC}[38;2;255;161;22m"
    $GREEN = "${ESC}[32m"
    $RED = "${ESC}[31m"
    $RESET = "${ESC}[0m"
}
else {
    $GRAY = ""
    $ORANGE = ""
    $GREEN = ""
    $RED = ""
    $RESET = ""
}

function banner {
    $lines = @(
        " ▄▄▄  ▄▄▄▄  ▄▄▄▄▄ ▄▄  ▄▄ #▄▄    ▄▄▄▄▄ ▄▄▄▄▄ ▄▄▄▄▄▄ #▄▄▄▄  ▄▄▄  ▄▄▄▄  ▄▄▄▄▄"
        "██▀██ ██▄█▀ ██▄▄  ███▄██ #██    ██▄▄  ██▄▄    ██  #██▀▀▀ ██▀██ ██▀██ ██▄▄ "
        "▀███▀ ██    ██▄▄▄ ██ ▀██ #██▄▄▄ ██▄▄▄ ██▄▄▄   ██  #▀████ ▀███▀ ████▀ ██▄▄▄"
    )

    foreach ($line in $lines) {
        $parts = $line.Split('#')
        if ($parts.Length -ne 3) {
            Write-Host "${GRAY}${line}${RESET}"
            continue
        }

        Write-Host "${GRAY}$($parts[0])${ORANGE}$($parts[1])${GRAY}$($parts[2])${RESET}"
    }

    Write-Host ""
}

function info ($msg) {
    Write-Host "${ORANGE}›${RESET} $msg"
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
