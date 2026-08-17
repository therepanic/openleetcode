function rotateTheBox(boxGrid: string[][]): string[][] {
  const r = boxGrid.length;
  const c = boxGrid[0].length;
  const rotate: string[][] = Array.from({ length: c }, () =>
    Array(r).fill("."),
  );
  for (let i = 0; i < r; i++) {
    let bottom = c - 1;
    for (let j = c - 1; j >= 0; j--) {
      if (boxGrid[i][j] === "#") {
        rotate[bottom][r - 1 - i] = "#";
        bottom--;
      } else if (boxGrid[i][j] === "*") {
        rotate[j][r - 1 - i] = "*";
        bottom = j - 1;
      }
    }
  }
  return rotate;
}
