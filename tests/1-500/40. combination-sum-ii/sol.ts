function combinationSum2(candidates: number[], target: number): number[][] {
  candidates.sort((a, b) => a - b);
  const res: number[][] = [];
  const cur: number[] = [];

  const backtrack = (start: number, total: number): void => {
    if (total === target) {
      res.push([...cur]);
      return;
    }

    let prev = Number.NaN;
    for (let i = start; i < candidates.length; i++) {
      if (i > start && candidates[i] === prev) {
        continue;
      }
      if (total + candidates[i] > target) {
        break;
      }
      cur.push(candidates[i]);
      backtrack(i + 1, total + candidates[i]);
      cur.pop();
      prev = candidates[i];
    }
  };

  backtrack(0, 0);
  return res;
}
