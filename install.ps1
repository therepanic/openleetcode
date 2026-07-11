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
        "▄▄▄▄ ▄▄▄▄ ▄▄▄▄ ▄▄▄  #██ ▄▄▄▄ ▄▄▄▄ ▄██▄ #▄▄▄▄ ▄▄▄▄ ▄▄▄█ ▄▄▄▄"
        "█▄▄█ █▄▄█ ███▄ █  █ #██ ███▄ ███▄  ██▄ #█▄▄▄ █▄▄█ █▄▄█ ███▄"
        "     ▀"
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

function Test-Utf8Console {
    return [bool]$env:WT_SESSION `
        -or [bool]$env:TERMINUS_SUBLIME `
        -or $env:ConEmuTask -eq '{cmd::Cmder}' `
        -or $env:TERM_PROGRAM -eq 'Terminus-Sublime' `
        -or $env:TERM_PROGRAM -eq 'vscode' `
        -or $env:TERM -eq 'xterm-256color' `
        -or $env:TERM -eq 'alacritty' `
        -or $env:TERM -eq 'rxvt-unicode' `
        -or $env:TERM -eq 'rxvt-unicode-256color' `
        -or $env:TERMINAL_EMULATOR -eq 'JetBrains-JediTerm'
}

if (Test-Utf8Console) {
    $SYMBOL_INFO = '›'
    $SYMBOL_SUCCESS = '✓'
    $SYMBOL_ERROR = '✗'
} else {
    $SYMBOL_INFO = '›'
    $SYMBOL_SUCCESS = '√'
    $SYMBOL_ERROR = 'x'
}

function info ($msg) {
    Write-Host "${ORANGE}${SYMBOL_INFO}${RESET} $msg"
}

function success ($msg) {
    Write-Host "${GREEN}${SYMBOL_SUCCESS} $msg${RESET}"
}

function error ($msg) {
    [Console]::Error.WriteLine("${RED}${SYMBOL_ERROR} $msg${RESET}")
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

if ($LASTEXITCODE -ne 0) {
    error "Failed to download: $url"
    exit 1
}

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
success "Start backend manually."
success "Run: $BIN_NAME"
