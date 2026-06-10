function findRepeatedDnaSequences(s: string): string[] {
  const seen = new Map<string, number>();
  const ans: string[] = [];
  for (let i = 0; i + 10 <= s.length; i++) {
    const sub = s.slice(i, i + 10);
    const count = seen.get(sub) ?? 0;
    if (count === 1) ans.push(sub);
    seen.set(sub, count + 1);
  }
  return ans;
}
