function minAreaFreeRect(points: number[][]): number {
  let ans = Infinity;
  const seen = new Map<string, [number, number][]>();
  const n = points.length;
  for (let i = 0; i < n; i++) {
    const [x0, y0] = points[i];
    for (let j = i + 1; j < n; j++) {
      const [x1, y1] = points[j];
      const cx = (x0 + x1) / 2;
      const cy = (y0 + y1) / 2;
      const d2 = (x0 - x1) ** 2 + (y0 - y1) ** 2;
      const key = `${cx},${cy},${d2}`;
      if (seen.has(key)) {
        for (const [xx, yy] of seen.get(key)!) {
          const area = Math.sqrt(
            ((x0 - xx) ** 2 + (y0 - yy) ** 2) *
              ((x1 - xx) ** 2 + (y1 - yy) ** 2),
          );
          ans = Math.min(ans, area);
        }
      }
      if (!seen.has(key)) seen.set(key, []);
      seen.get(key)!.push([x0, y0]);
    }
  }
  return ans === Infinity ? 0 : ans;
}
