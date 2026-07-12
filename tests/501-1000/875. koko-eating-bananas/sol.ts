function minEatingSpeed(piles: number[], h: number): number {
  const canFinish = (k: number): boolean => {
    let hours = 0;
    for (const pile of piles) {
      hours += Math.floor(pile / k);
      if (pile % k !== 0) {
        hours++;
      }
      if (hours > h) {
        return false;
      }
    }
    return true;
  };

  let left = 1;
  let right = Math.max(...piles);
  let ans = right;
  while (left <= right) {
    const mid = left + Math.floor((right - left) / 2);
    if (canFinish(mid)) {
      ans = mid;
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }
  return ans;
}
