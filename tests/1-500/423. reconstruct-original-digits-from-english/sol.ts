function originalDigits(s: string): string {
  const c: { [key: string]: number } = {};
  for (const ch of s) {
    c[ch] = (c[ch] || 0) + 1;
  }
  const d: number[] = new Array(10).fill(0);
  d[0] = c["z"] || 0;
  d[2] = c["w"] || 0;
  d[4] = c["u"] || 0;
  d[6] = c["x"] || 0;
  d[8] = c["g"] || 0;
  d[1] = (c["o"] || 0) - d[0] - d[2] - d[4];
  d[3] = (c["h"] || 0) - d[8];
  d[5] = (c["f"] || 0) - d[4];
  d[7] = (c["s"] || 0) - d[6];
  d[9] = (c["i"] || 0) - d[5] - d[6] - d[8];
  let result = "";
  for (let i = 0; i <= 9; i++) {
    result += i.toString().repeat(d[i]);
  }
  return result;
}
