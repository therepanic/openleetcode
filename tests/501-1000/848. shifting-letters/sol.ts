function shiftingLetters(s: string, shifts: number[]): string {
  const n = shifts.length;
  const l: number[] = new Array(n);
  const z = shifts.reduce((a, b) => a + b, 0);
  l[0] = z;
  for (let i = 1; i < n; i++) {
    l[i] = l[i - 1] - shifts[i - 1];
  }
  const p = s.split("").map((c) => c.charCodeAt(0) - 97);
  let k = "";
  for (let i = 0; i < n; i++) {
    k += String.fromCharCode(((p[i] + l[i]) % 26) + 97);
  }
  return k;
}
