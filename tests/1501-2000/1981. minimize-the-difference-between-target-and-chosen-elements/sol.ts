function minimizeTheDifference(mat: number[][], target: number): number {
  for (let row of mat) {
    row.sort((a, b) => a - b);
  }
  let dp: Map<string, number> = new Map();
  let mini = Number.MAX_SAFE_INTEGER;

  function dfs(i: number, ans: number): number {
    if (i < 0) {
      let diff = Math.abs(ans);
      if (diff < mini) mini = diff;
      return diff;
    }
    let key = `${i},${ans}`;
    if (dp.has(key)) return dp.get(key)!;
    if (ans < 0 && Math.abs(ans) > mini) return Number.MAX_SAFE_INTEGER / 2;
    let take = Number.MAX_SAFE_INTEGER / 2;
    for (let z = 0; z < mat[i].length; z++) {
      if (z > 0 && mat[i][z] === mat[i][z - 1]) continue;
      take = Math.min(take, dfs(i - 1, ans - mat[i][z]));
      if (take === 0) break;
    }
    dp.set(key, take);
    return take;
  }

  return dfs(mat.length - 1, target);
}
