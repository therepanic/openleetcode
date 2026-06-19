function findPoisonedDuration(timeSeries: number[], duration: number): number {
  let totalSecs = 0;
  let prev: number | null = null;

  for (const t of timeSeries) {
    totalSecs += duration;

    if (prev !== null && prev + duration > t) {
      totalSecs -= prev + duration - t;
    }

    prev = t;
  }

  return totalSecs;
}
