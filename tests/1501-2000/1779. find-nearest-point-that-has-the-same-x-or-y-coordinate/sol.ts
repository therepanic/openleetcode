function nearestValidPoint(x: number, y: number, points: number[][]): number {
  let currentMinDistance = 20001;
  let currentMinIndex = -1;
  for (let i = 0; i < points.length; i++) {
    const a = points[i][0];
    const b = points[i][1];
    if (x === a || y === b) {
      const distance = Math.abs(x - a) + Math.abs(y - b);
      if (distance < currentMinDistance) {
        currentMinDistance = distance;
        currentMinIndex = i;
      }
    }
  }
  return currentMinIndex;
}
