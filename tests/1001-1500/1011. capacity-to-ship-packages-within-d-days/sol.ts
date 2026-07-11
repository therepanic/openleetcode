function shipWithinDays(weights: number[], days: number): number {
  let low = Math.max(...weights);
  let high = weights.reduce((a, b) => a + b, 0);

  while (low <= high) {
    const mid = Math.floor((low + high) / 2);

    let requiredDays = 1;
    let load = 0;

    for (const weight of weights) {
      if (load + weight > mid) {
        requiredDays++;
        load = weight;
      } else {
        load += weight;
      }
    }

    if (requiredDays <= days) {
      high = mid - 1;
    } else {
      low = mid + 1;
    }
  }

  return low;
}
