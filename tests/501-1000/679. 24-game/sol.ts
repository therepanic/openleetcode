function judgePoint24(cards: number[]): boolean {
  const EPS = 1e-6;

  const dfs = (nums: number[]): boolean => {
    if (nums.length === 1) {
      return Math.abs(nums[0] - 24.0) < EPS;
    }

    for (let i = 0; i < nums.length; i++) {
      for (let j = 0; j < nums.length; j++) {
        if (i === j) continue;

        const nextNums: number[] = [];
        for (let k = 0; k < nums.length; k++) {
          if (k !== i && k !== j) {
            nextNums.push(nums[k]);
          }
        }

        const a = nums[i],
          b = nums[j];
        const candidates: number[] = [a + b, a - b, b - a, a * b];
        if (Math.abs(b) > EPS) candidates.push(a / b);
        if (Math.abs(a) > EPS) candidates.push(b / a);

        for (const val of candidates) {
          if (dfs([...nextNums, val])) {
            return true;
          }
        }
      }
    }
    return false;
  };

  return dfs(cards.map(Number));
}
