function largestTriangleArea(points: number[][]): number {
  let maxArea = 0.0;
  const n = points.length;
  for (let i = 0; i < n; i++) {
    const [x1, y1] = points[i];
    for (let j = i; j < n; j++) {
      const [x2, y2] = points[j];
      for (let k = j; k < n; k++) {
        const [x3, y3] = points[k];
        const area = Math.abs(
          0.5 * (x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)),
        );
        if (area > maxArea) {
          maxArea = area;
        }
      }
    }
  }
  return maxArea;
}
