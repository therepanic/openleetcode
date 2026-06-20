function toHex(num: number): string {
  if (num === 0) return "0";
  let n = num >>> 0;
  const h = "0123456789abcdef";
  const r: string[] = [];
  while (n > 0) {
    r.push(h[n & 15]);
    n = Math.floor(n / 16);
  }
  return r.reverse().join("");
}
