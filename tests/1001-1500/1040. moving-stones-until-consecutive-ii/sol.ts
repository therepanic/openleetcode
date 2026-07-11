function numMovesStonesII(stones: number[]): number[] {
  stones.sort((a, b) => a - b);
  const n = stones.length;

  const maxMoves = Math.max(
    stones[n - 1] - stones[1] - (n - 2),
    stones[n - 2] - stones[0] - (n - 2),
  );

  let minMoves = n;
  let left = 0;
  for (let right = 0; right < n; right++) {
    while (stones[right] - stones[left] + 1 > n) {
      left++;
    }
    const currentWindowSize = right - left + 1;
    if (
      currentWindowSize === n - 1 &&
      stones[right] - stones[left] + 1 === n - 1
    ) {
      minMoves = Math.min(minMoves, 2);
    } else {
      minMoves = Math.min(minMoves, n - currentWindowSize);
    }
  }

  return [minMoves, maxMoves];
}
