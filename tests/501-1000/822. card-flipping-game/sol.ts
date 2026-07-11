function flipgame(fronts: number[], backs: number[]): number {
  const bad = new Set<number>();
  for (let i = 0; i < fronts.length; i++) {
    if (fronts[i] === backs[i]) {
      bad.add(fronts[i]);
    }
  }
  let best = 2001;
  for (let i = 0; i < fronts.length; i++) {
    if (!bad.has(fronts[i]) && fronts[i] < best) {
      best = fronts[i];
    }
    if (!bad.has(backs[i]) && backs[i] < best) {
      best = backs[i];
    }
  }
  return best <= 2000 ? best : 0;
}
