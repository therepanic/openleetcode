function isScramble(s1: string, s2: string): boolean {
  const memo = new Map<string, boolean>();
  const dfs = (a: string, b: string): boolean => {
    if (a === b) return true;
    const key = `${a}#${b}`;
    if (memo.has(key)) return memo.get(key)!;
    const counts = new Array<number>(26).fill(0);
    for (let i = 0; i < a.length; i++) {
      counts[a.charCodeAt(i) - 97]++;
      counts[b.charCodeAt(i) - 97]--;
    }
    if (counts.some((x) => x !== 0)) {
      memo.set(key, false);
      return false;
    }
    for (let i = 1; i < a.length; i++) {
      if (dfs(a.slice(0, i), b.slice(0, i)) && dfs(a.slice(i), b.slice(i))) {
        memo.set(key, true);
        return true;
      }
      if (
        dfs(a.slice(0, i), b.slice(b.length - i)) &&
        dfs(a.slice(i), b.slice(0, b.length - i))
      ) {
        memo.set(key, true);
        return true;
      }
    }
    memo.set(key, false);
    return false;
  };
  return dfs(s1, s2);
}
