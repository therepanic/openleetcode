function maxNonOverlapping(nums: number[], target: number): number {
  let numOfSubarrays = 0;
  let temp = 0;
  let visited = new Set<number>([0]);
  for (const num of nums) {
    temp += num;
    const prev = temp - target;
    if (visited.has(prev)) {
      visited = new Set<number>();
      numOfSubarrays++;
    }
    visited.add(temp);
  }
  return numOfSubarrays;
}
