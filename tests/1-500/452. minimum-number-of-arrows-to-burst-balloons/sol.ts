function findMinArrowShots(points: number[][]): number {
  points.sort((a, b) => a[1] - b[1]);
  let arrows = 1;
  let end = points[0][1];
  for (const [start, finish] of points) {
    if (start > end) {
      arrows++;
      end = finish;
    }
  }
  return arrows;
}
