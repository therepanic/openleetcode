function visiblePoints(
  points: number[][],
  angle: number,
  location: number[],
): number {
  const angles: number[] = [];
  let same = 0;
  const [x0, y0] = location;

  for (const p of points) {
    const dx = p[0] - x0;
    const dy = p[1] - y0;
    if (dx === 0 && dy === 0) {
      same++;
      continue;
    }
    const ang = (Math.atan2(dy, dx) * 180) / Math.PI;
    angles.push(ang);
  }

  if (angles.length === 0) return same;

  angles.sort((a, b) => a - b);
  const n = angles.length;
  const full = [...angles, ...angles.map((a) => a + 360)];

  let maxVis = 0;
  let j = 0;
  for (let i = 0; i < n; i++) {
    while (j < full.length && full[j] - full[i] <= angle) {
      j++;
    }
    maxVis = Math.max(maxVis, j - i);
  }

  return maxVis + same;
}
