function combinationSum(candidates: number[], target: number): number[][] {
  candidates.sort((a, b) => a - b);
  const res: number[][] = [];
  const cur: number[] = [];

  const backtrack = (start: number, total: number): void => {
    if (total === target) {
      res.push([...cur]);
      return;
    }

    for (let i = start; i < candidates.length; i++) {
      if (total + candidates[i] > target) {
        break;
      }
      cur.push(candidates[i]);
      backtrack(i, total + candidates[i]);
      cur.pop();
    }
  };

  backtrack(0, 0);
  return res;
}
