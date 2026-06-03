#!/usr/bin/env sh
set -eu

REPO="therepanic/openleetcode"
BIN_NAME="openleetcode"
INSTALL_DIR="${INSTALL_DIR:-/usr/local/bin}"

if [ -t 1 ] && [ -z "${NO_COLOR:-}" ]; then
  CYAN="$(printf '\033[1;36m')"
  GREEN="$(printf '\033[32m')"
  RED="$(printf '\033[31m')"
  DIM="$(printf '\033[2m')"
  RESET="$(printf '\033[0m')"
else
  CYAN=""
  GREEN=""
  RED=""
  DIM=""
  RESET=""
fi

banner() {
  printf '%s' "$CYAN"
  cat << 'EOF'
 ▄▄▄  ▄▄▄▄  ▄▄▄▄▄ ▄▄  ▄▄ ▄▄    ▄▄▄▄▄ ▄▄▄▄▄ ▄▄▄▄▄▄ ▄▄▄▄  ▄▄▄  ▄▄▄▄  ▄▄▄▄▄
██▀██ ██▄█▀ ██▄▄  ███▄██ ██    ██▄▄  ██▄▄    ██  ██▀▀▀ ██▀██ ██▀██ ██▄▄
▀███▀ ██    ██▄▄▄ ██ ▀██ ██▄▄▄ ██▄▄▄ ██▄▄▄   ██  ▀████ ▀███▀ ████▀ ██▄▄▄
EOF
  printf '%s\n' "$RESET"
}

info() {
  printf '%s›%s %s\n' "$CYAN" "$RESET" "$1"
}

success() {
  printf '%s✓%s %s\n' "$GREEN" "$RESET" "$1"
}

error() {
  printf '%s✗%s %s\n' "$RED" "$RESET" "$1" >&2
}

banner

info "Installing ${BIN_NAME}..."

os="$(uname -s)"
arch="$(uname -m)"

case "$os" in
  Linux) os_name="linux" ;;
  Darwin) os_name="darwin" ;;
  *)
    error "Unsupported OS: $os"
    exit 1
    ;;
esac

case "$arch" in
  x86_64 | amd64) arch_name="amd64" ;;
  arm64 | aarch64) arch_name="arm64" ;;
  *)
    error "Unsupported architecture: $arch"
    exit 1
    ;;
esac

asset="openleetcode-${os_name}-${arch_name}"
url="https://github.com/${REPO}/releases/latest/download/${asset}"

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT

info "Detected target: ${os_name}-${arch_name}"
info "Downloading latest release..."
curl -fsSL "$url" -o "$tmp"

chmod +x "$tmp"

info "Installing as ${INSTALL_DIR}/${BIN_NAME}"

if [ ! -d "$INSTALL_DIR" ]; then
  mkdir -p "$INSTALL_DIR" 2> /dev/null || sudo mkdir -p "$INSTALL_DIR"
fi

if [ -w "$INSTALL_DIR" ]; then
  install -m 755 "$tmp" "$INSTALL_DIR/$BIN_NAME"
else
  sudo install -m 755 "$tmp" "$INSTALL_DIR/$BIN_NAME"
fi

success "Installed successfully!"
success "Run: ${BIN_NAME}"
