function countPoints(points: number[][], queries: number[][]): number[] {
  const result: number[] = new Array(queries.length).fill(0);
  for (let i = 0; i < queries.length; i++) {
    for (let j = 0; j < points.length; j++) {
      const dx = queries[i][0] - points[j][0];
      const dy = queries[i][1] - points[j][1];
      if (dx * dx + dy * dy <= queries[i][2] * queries[i][2]) {
        result[i]++;
      }
    }
  }
  return result;
}
