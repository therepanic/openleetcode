function findLexSmallestString(s: string, a: number, b: number): string {
  const n = s.length;
  const seen = new Set<string>();
  const dfs = (cur: string) => {
    if (seen.has(cur)) return;
    seen.add(cur);
    const add = cur.split("");
    for (let i = 1; i < n; i += 2) {
      add[i] = String((Number(add[i]) + a) % 10);
    }
    dfs(add.join(""));
    dfs(cur.slice(n - b) + cur.slice(0, n - b));
  };
  dfs(s);
  return Array.from(seen).sort()[0];
}
