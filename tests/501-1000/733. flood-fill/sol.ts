function floodFill(
  image: number[][],
  sr: number,
  sc: number,
  color: number,
): number[][] {
  const old = image[sr][sc];
  if (old === color) return image;
  const m = image.length;
  const n = image[0].length;
  const dfs = (i: number, j: number): void => {
    if (i < 0 || i >= m || j < 0 || j >= n || image[i][j] !== old) return;
    image[i][j] = color;
    dfs(i + 1, j);
    dfs(i - 1, j);
    dfs(i, j + 1);
    dfs(i, j - 1);
  };
  dfs(sr, sc);
  return image;
}
