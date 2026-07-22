function findTheCity(
  n: number,
  edges: number[][],
  distanceThreshold: number,
): number {
  const INF = Infinity;
  const matrix: number[][] = Array.from({ length: n }, () =>
    Array(n).fill(INF),
  );

  for (let i = 0; i < n; i++) {
    matrix[i][i] = 0;
  }

  for (const [u, v, w] of edges) {
    matrix[u][v] = w;
    matrix[v][u] = w;
  }

  for (let via = 0; via < n; via++) {
    for (let i = 0; i < n; i++) {
      for (let j = 0; j < n; j++) {
        if (matrix[i][via] + matrix[via][j] < matrix[i][j]) {
          matrix[i][j] = matrix[i][via] + matrix[via][j];
        }
      }
    }
  }

  let minReachable = n;
  let ans = -1;

  for (let i = 0; i < n; i++) {
    let count = 0;
    for (let j = 0; j < n; j++) {
      if (matrix[i][j] <= distanceThreshold) {
        count++;
      }
    }
    if (count <= minReachable) {
      minReachable = count;
      ans = i;
    }
  }

  return ans;
}
