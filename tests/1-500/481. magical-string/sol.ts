function magicalString(n: number): number {
  if (n <= 0) return 0;
  if (n <= 3) return 1;
  const s: number[] = [1, 2, 2];
  let i = 2;
  while (s.length < n) {
    const nextVal = 3 - s[s.length - 1];
    const count = s[i];
    for (let j = 0; j < count && s.length < n; j++) {
      s.push(nextVal);
    }
    i++;
  }
  return s.slice(0, n).filter((x) => x === 1).length;
}
