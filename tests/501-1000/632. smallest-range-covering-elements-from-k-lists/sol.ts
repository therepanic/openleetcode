function smallestRange(nums: number[][]): number[] {
  const values: Array<[number, number]> = [];
  for (let i = 0; i < nums.length; i++) {
    for (const value of nums[i]) {
      values.push([value, i]);
    }
  }
  values.sort((a, b) => a[0] - b[0] || a[1] - b[1]);

  const freq = new Map<number, number>();
  let covered = 0;
  let left = 0;
  let best: [number, number] = [values[0][0], values[values.length - 1][0]];

  for (let right = 0; right < values.length; right++) {
    const listIdx = values[right][1];
    const count = freq.get(listIdx) ?? 0;
    if (count === 0) {
      covered++;
    }
    freq.set(listIdx, count + 1);

    while (covered === nums.length) {
      const currentLeft = values[left][0];
      const currentRight = values[right][0];
      if (
        currentRight - currentLeft < best[1] - best[0] ||
        (currentRight - currentLeft === best[1] - best[0] &&
          currentLeft < best[0])
      ) {
        best = [currentLeft, currentRight];
      }
      const leftList = values[left][1];
      const nextCount = (freq.get(leftList) ?? 0) - 1;
      freq.set(leftList, nextCount);
      if (nextCount === 0) {
        covered--;
      }
      left++;
    }
  }
  return best;
}
