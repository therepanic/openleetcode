function baseNeg2(n: number): string {
  if (n === 0) {
    return "0";
  }
  const res: string[] = [];
  while (n !== 0) {
    const digit = n & 1;
    res.push(String(digit));
    n = Math.trunc((n - digit) / -2);
  }
  return res.reverse().join("");
}
