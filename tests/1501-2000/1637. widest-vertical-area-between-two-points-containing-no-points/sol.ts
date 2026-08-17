function maxWidthOfVerticalArea(points: number[][]): number {
  let maxWidth = 0;
  points.sort((a, b) => a[0] - b[0]);
  for (let i = 0; i < points.length - 1; i++) {
    const width = points[i + 1][0] - points[i][0];
    maxWidth = Math.max(maxWidth, width);
  }
  return maxWidth;
}
