function trapRainWater(heightMap: number[][]): number {
  if (!heightMap || heightMap.length < 3 || heightMap[0].length < 3) {
    return 0;
  }

  const m = heightMap.length,
    n = heightMap[0].length;
  const visited: boolean[][] = Array.from({ length: m }, () =>
    Array(n).fill(false),
  );
  const heap: [number, number, number][] = [];

  for (let i = 0; i < m; i++) {
    heap.push([heightMap[i][0], i, 0]);
    heap.push([heightMap[i][n - 1], i, n - 1]);
    visited[i][0] = visited[i][n - 1] = true;
  }
  for (let j = 0; j < n; j++) {
    heap.push([heightMap[0][j], 0, j]);
    heap.push([heightMap[m - 1][j], m - 1, j]);
    visited[0][j] = visited[m - 1][j] = true;
  }

  heap.sort((a, b) => a[0] - b[0]);
  let result = 0;
  const directions = [
    [0, 1],
    [1, 0],
    [0, -1],
    [-1, 0],
  ];

  while (heap.length > 0) {
    const [height, x, y] = heap.shift()!;

    for (const [dx, dy] of directions) {
      const nx = x + dx,
        ny = y + dy;
      if (nx >= 0 && nx < m && ny >= 0 && ny < n && !visited[nx][ny]) {
        result += Math.max(0, height - heightMap[nx][ny]);
        heap.push([Math.max(height, heightMap[nx][ny]), nx, ny]);
        visited[nx][ny] = true;
      }
    }
    heap.sort((a, b) => a[0] - b[0]);
  }

  return result;
}
