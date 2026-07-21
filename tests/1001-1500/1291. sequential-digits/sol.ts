function sequentialDigits(low: number, high: number): number[] {
  const q: number[] = [];
  for (let i = 1; i <= 9; i++) {
    q.push(i);
  }
  for (let i = 0; i < q.length; i++) {
    const x = q[i];
    const d = x % 10;
    if (d < 9) {
      q.push(x * 10 + d + 1);
    }
  }
  return q.filter((x) => low <= x && x <= high);
}
