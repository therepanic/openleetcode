function minFlips(a: number, b: number, c: number): number {
  let count = 0;
  while (a !== 0 || b !== 0 || c !== 0) {
    const abit = a & 1;
    const bbit = b & 1;
    const cbit = c & 1;

    if (cbit === 0) {
      if (abit === 1) count++;
      if (bbit === 1) count++;
    } else {
      if (abit === 0 && bbit === 0) count++;
    }

    a >>= 1;
    b >>= 1;
    c >>= 1;
  }
  return count;
}
