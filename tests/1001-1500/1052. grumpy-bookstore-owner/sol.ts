function maxSatisfied(
  customers: number[],
  grumpy: number[],
  minutes: number,
): number {
  const n = customers.length;
  let totalSatisfied = 0;
  let currentWindowGain = 0;

  for (let i = 0; i < n; i++) {
    if (grumpy[i] === 0) {
      totalSatisfied += customers[i];
    } else if (i < minutes) {
      currentWindowGain += customers[i];
    }
  }

  let maxWindowGain = currentWindowGain;

  for (let i = minutes; i < n; i++) {
    if (grumpy[i] === 1) {
      currentWindowGain += customers[i];
    }
    if (grumpy[i - minutes] === 1) {
      currentWindowGain -= customers[i - minutes];
    }
    if (currentWindowGain > maxWindowGain) {
      maxWindowGain = currentWindowGain;
    }
  }

  return totalSatisfied + maxWindowGain;
}
