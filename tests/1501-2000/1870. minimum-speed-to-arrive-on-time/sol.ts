function minSpeedOnTime(dist: number[], hour: number): number {
  if (dist.length === 0) return -1;

  const canReach = (speed: number): boolean => {
    let total = 0;
    for (let i = 0; i < dist.length - 1; i++) {
      total += Math.ceil(dist[i] / speed);
    }
    total += dist[dist.length - 1] / speed;
    return total <= hour;
  };

  let low = 1,
    high = 10000000,
    ans = -1;
  while (low <= high) {
    const mid = Math.floor((low + high) / 2);
    if (canReach(mid)) {
      ans = mid;
      high = mid - 1;
    } else {
      low = mid + 1;
    }
  }
  return ans;
}
