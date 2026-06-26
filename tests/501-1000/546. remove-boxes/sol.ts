function removeBoxes(boxes: number[]): number {
  const groups: [number, number][] = [];
  let i = 0;
  while (i < boxes.length) {
    const color = boxes[i];
    let count = 0;
    while (i < boxes.length && boxes[i] === color) {
      count++;
      i++;
    }
    groups.push([color, count]);
  }

  const n = groups.length;
  const dp: number[][][] = Array.from({ length: n }, () =>
    Array.from({ length: n }, () => Array(boxes.length + 1).fill(0)),
  );

  const dfs = (l: number, r: number, k: number): number => {
    if (l > r) return 0;
    if (dp[l][r][k] !== 0) return dp[l][r][k];

    const color = groups[l][0];
    const count = groups[l][1] + k;
    let res = count * count + dfs(l + 1, r, 0);

    for (let i = l + 1; i <= r; i++) {
      if (groups[i][0] === color) {
        const left = dfs(l + 1, i - 1, 0);
        const right = dfs(i, r, count);
        res = Math.max(res, left + right);
      }
    }

    dp[l][r][k] = res;
    return res;
  };

  return dfs(0, n - 1, 0);
}
