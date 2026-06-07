function generateParenthesis(n: number): string[] {
  const res: string[] = [];
  const cur: string[] = [];
  function dfs(open: number, close: number): void {
    if (open === n && close === n) {
      res.push(cur.join(""));
      return;
    }
    if (open < n) {
      cur.push("(");
      dfs(open + 1, close);
      cur.pop();
    }
    if (close < open) {
      cur.push(")");
      dfs(open, close + 1);
      cur.pop();
    }
  }
  dfs(0, 0);
  return res;
}
