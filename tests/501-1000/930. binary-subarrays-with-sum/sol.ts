function numSubarraysWithSum(nums: number[], goal: number): number {
  const n: number = nums.length;
  const posOf1s: number[] = [-1];
  let total: number = 0;
  let count: number = 0;

  if (goal === 0) {
    for (const num of nums) {
      if (num === 0) {
        count++;
        total += count;
      } else {
        count = 0;
      }
    }
    return total;
  }

  for (let i = 0; i < n; i++) {
    if (nums[i] === 1) {
      posOf1s.push(i);
    }
  }
  posOf1s.push(n);

  for (let i = 1; i < posOf1s.length - goal; i++) {
    const leftChoices: number = posOf1s[i] - posOf1s[i - 1];
    const rightChoices: number = posOf1s[i + goal] - posOf1s[i + goal - 1];
    total += leftChoices * rightChoices;
  }

  return total;
}
