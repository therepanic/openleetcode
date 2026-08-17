function secondHighest(s: string): number {
  const digits = new Set<number>();
  for (const c of s) {
    if (c >= "0" && c <= "9") {
      digits.add(parseInt(c));
    }
  }
  if (digits.size > 1) {
    const max = Math.max(...digits);
    digits.delete(max);
    return Math.max(...digits);
  }
  return -1;
}
