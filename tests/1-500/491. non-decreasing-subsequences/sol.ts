function findSubsequences(nums: number[]): number[][] {
  const result: Set<string> = new Set();
  const res: number[][] = [];

  function backtrack(index: number, path: number[]): void {
    if (path.length >= 2) {
      const key = path.toString();
      if (!result.has(key)) {
        result.add(key);
        res.push([...path]);
      }
    }
    for (let i = index; i < nums.length; i++) {
      if (path.length === 0 || nums[i] >= path[path.length - 1]) {
        path.push(nums[i]);
        backtrack(i + 1, path);
        path.pop();
      }
    }
  }

  backtrack(0, []);
  return res;
}
