function findRadius(houses: number[], heaters: number[]): number {
  houses.sort((a, b) => a - b);
  heaters.sort((a, b) => a - b);
  let radius = 0;
  for (const house of houses) {
    let left = 0,
      right = heaters.length - 1;
    while (left < right) {
      const mid = Math.floor((left + right) / 2);
      if (heaters[mid] < house) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    let dist = Math.abs(heaters[left] - house);
    if (left > 0) {
      dist = Math.min(dist, Math.abs(heaters[left - 1] - house));
    }
    radius = Math.max(radius, dist);
  }
  return radius;
}
