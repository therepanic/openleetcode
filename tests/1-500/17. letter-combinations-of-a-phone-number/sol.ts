function letterCombinations(digits: string): string[] {
  if (digits.length === 0) return [];
  const maps = [
    "",
    "",
    "abc",
    "def",
    "ghi",
    "jkl",
    "mno",
    "pqrs",
    "tuv",
    "wxyz",
  ];
  const res: string[] = [];
  const cur: string[] = [];
  function dfs(idx: number): void {
    if (idx === digits.length) {
      res.push(cur.join(""));
      return;
    }
    const letters = maps[Number(digits[idx])];
    for (const ch of letters) {
      cur.push(ch);
      dfs(idx + 1);
      cur.pop();
    }
  }
  dfs(0);
  return res;
}
