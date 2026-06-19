function pacificAtlantic(heights: number[][]): number[][] {
  if (!heights.length) return [];
  const m = heights.length,
    n = heights[0].length;
  const directions = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1],
  ];

  const pacific: boolean[][] = Array.from({ length: m }, () =>
    Array(n).fill(false),
  );
  const atlantic: boolean[][] = Array.from({ length: m }, () =>
    Array(n).fill(false),
  );

  const dfs = (i: number, j: number, visited: boolean[][]) => {
    visited[i][j] = true;
    for (const [dx, dy] of directions) {
      const x = i + dx,
        y = j + dy;
      if (
        x >= 0 &&
        x < m &&
        y >= 0 &&
        y < n &&
        !visited[x][y] &&
        heights[x][y] >= heights[i][j]
      ) {
        dfs(x, y, visited);
      }
    }
  };

  for (let j = 0; j < n; j++) dfs(0, j, pacific);
  for (let i = 0; i < m; i++) dfs(i, 0, pacific);
  for (let j = 0; j < n; j++) dfs(m - 1, j, atlantic);
  for (let i = 0; i < m; i++) dfs(i, n - 1, atlantic);

  const result: number[][] = [];
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (pacific[i][j] && atlantic[i][j]) {
        result.push([i, j]);
      }
    }
  }
  return result;
}
