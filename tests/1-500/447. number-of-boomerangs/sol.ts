function numberOfBoomerangs(points: number[][]): number {
  let result = 0;
  for (const p of points) {
    const distances: Map<number, number> = new Map();
    for (const q of points) {
      const d = (p[0] - q[0]) * (p[0] - q[0]) + (p[1] - q[1]) * (p[1] - q[1]);
      distances.set(d, (distances.get(d) || 0) + 1);
    }
    for (const count of distances.values()) {
      result += count * (count - 1);
    }
  }
  return result;
}
