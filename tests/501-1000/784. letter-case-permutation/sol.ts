function letterCasePermutation(s: string): string[] {
  const ans: string[] = [];
  const solve = (idx: number, curr: string) => {
    if (idx === s.length) {
      ans.push(curr);
      return;
    }
    if (/\d/.test(s[idx])) {
      solve(idx + 1, curr + s[idx]);
      return;
    }
    solve(idx + 1, curr + s[idx].toLowerCase());
    solve(idx + 1, curr + s[idx].toUpperCase());
  };
  solve(0, "");
  return ans;
}
