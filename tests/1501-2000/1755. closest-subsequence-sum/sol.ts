function minAbsDifference(nums: number[], goal: number): number {
  const sums = (values: number[]): number[] => {
    const result: number[] = [0];
    for (const value of values) {
      const currentLen = result.length;
      for (let i = 0; i < currentLen; i++) {
        result.push(result[i] + value);
      }
    }
    return result;
  };
  const mid = Math.floor(nums.length / 2);
  const left = sums(nums.slice(0, mid)).sort((a, b) => a - b);
  const right = sums(nums.slice(mid)).sort((a, b) => a - b);
  let answer = Math.abs(goal);
  let j = right.length - 1;
  for (const value of left) {
    while (j > 0 && right[j - 1] >= goal - value) {
      j--;
    }
    answer = Math.min(answer, Math.abs(value + right[j] - goal));
    if (j > 0) {
      answer = Math.min(answer, Math.abs(value + right[j - 1] - goal));
    }
  }
  return answer;
}
