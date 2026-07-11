#!/usr/bin/env sh
set -eu

REPO="therepanic/openleetcode"
BIN_NAME="openleetcode"
INSTALL_DIR="${INSTALL_DIR:-/usr/local/bin}"

if [ -t 1 ] && [ -z "${NO_COLOR:-}" ]; then
  GRAY="$(printf '\033[38;2;179;179;179m')"
  ORANGE="$(printf '\033[38;2;255;161;22m')"
  GREEN="$(printf '\033[32m')"
  RED="$(printf '\033[31m')"
  RESET="$(printf '\033[0m')"
else
  GRAY=""
  ORANGE=""
  GREEN=""
  RED=""
  RESET=""
fi

banner() {
  while IFS= read -r line; do
    open_part=${line%%#*}
    rest=${line#*#}
    leet_part=${rest%%#*}
    code_part=${rest#*#}
    if [ "$line" = "$open_part" ]; then
      printf '%s%s%s\n' "$GRAY" "$line" "$RESET"
      continue
    fi
    printf '%s%s%s%s%s%s%s\n' "$GRAY" "$open_part" "$ORANGE" "$leet_part" "$GRAY" "$code_part" "$RESET"
  done << 'EOF'
▄▄▄▄ ▄▄▄▄ ▄▄▄▄ ▄▄▄  #██ ▄▄▄▄ ▄▄▄▄ ▄██▄ #▄▄▄▄ ▄▄▄▄ ▄▄▄█ ▄▄▄▄
█▄▄█ █▄▄█ ███▄ █  █ #██ ███▄ ███▄  ██▄ #█▄▄▄ █▄▄█ █▄▄█ ███▄
     ▀
EOF
}

info() {
  printf '%s›%s %s\n' "$ORANGE" "$RESET" "$1"
}

success() {
  printf '%s✓ %s%s\n' "$GREEN" "$1" "$RESET"
}

error() {
  printf '%s✗ %s%s\n' "$RED" "$1" "$RESET" >&2
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
backend_url="https://raw.githubusercontent.com/${REPO}/main/backends/piston/docker-compose.yml"

tmp="$(mktemp)"
backend_tmp="$(mktemp)"
trap 'rm -f "$tmp" "$backend_tmp"' EXIT

info "Detected target: ${os_name}-${arch_name}"
info "Downloading latest release..."
if ! curl -fsSL "$url" -o "$tmp"; then
  error "Failed to download: $url"
  exit 1
fi

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

info "Downloading Piston backend..."
curl -fsSL "$backend_url" -o "$backend_tmp"

info "Starting Piston backend..."
if command -v docker-compose >/dev/null 2>&1; then
  docker-compose -f "$backend_tmp" up -d
elif docker compose version >/dev/null 2>&1; then
  docker compose -f "$backend_tmp" up -d
else
  error "Docker Compose is not installed"
  exit 1
fi

rm -f "$backend_tmp"
success "Piston backend started successfully!"
success "Run: ${BIN_NAME}"
