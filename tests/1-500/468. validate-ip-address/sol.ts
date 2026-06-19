function validIPAddress(queryIP: string): string {
  if (queryIP.split(".").length - 1 === 3) {
    const parts = queryIP.split(".");
    let valid = true;
    for (const p of parts) {
      if (p.length === 0 || !/^\d+$/.test(p)) {
        valid = false;
        break;
      }
      const num = parseInt(p, 10);
      if (isNaN(num) || num < 0 || num > 255 || num.toString() !== p) {
        valid = false;
        break;
      }
    }
    if (valid) return "IPv4";
  } else if (queryIP.split(":").length - 1 === 7) {
    const parts = queryIP.split(":");
    let valid = true;
    for (const p of parts) {
      if (p.length < 1 || p.length > 4 || !/^[0-9a-fA-F]+$/.test(p)) {
        valid = false;
        break;
      }
    }
    if (valid) return "IPv6";
  }
  return "Neither";
}
