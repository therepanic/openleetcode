function combine(n: number, k: number): number[][] {
  const res: number[][] = [];
  const cur: number[] = [];

  const dfs = (start: number): void => {
    if (cur.length === k) {
      res.push(cur.slice());
      return;
    }
    for (let i = start; i <= n; i++) {
      cur.push(i);
      dfs(i + 1);
      cur.pop();
    }
  };

  dfs(1);
  return res;
}
