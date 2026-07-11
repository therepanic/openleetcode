function longestWPI(hours: number[]): number {
  let score = 0;
  let longestInterval = 0;
  const seenAt = new Map<number, number>();
  seenAt.set(0, -1);

  for (let i = 0; i < hours.length; i++) {
    score += hours[i] > 8 ? 1 : -1;

    if (score > 0) {
      longestInterval = i + 1;
    } else if (seenAt.has(score - 1)) {
      longestInterval = Math.max(longestInterval, i - seenAt.get(score - 1)!);
    }

    if (!seenAt.has(score)) {
      seenAt.set(score, i);
    }
  }

  return longestInterval;
}
