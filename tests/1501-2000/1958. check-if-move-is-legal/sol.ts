function checkMove(
  board: string[][],
  rMove: number,
  cMove: number,
  color: string,
): boolean {
  const opposite = color === "B" ? "W" : "B";
  const dirs = [
    [-1, -1],
    [-1, 0],
    [-1, 1],
    [0, -1],
    [0, 1],
    [1, -1],
    [1, 0],
    [1, 1],
  ];

  for (const [dr, dc] of dirs) {
    let r = rMove + dr;
    let c = cMove + dc;
    let cnt = 0;

    while (r >= 0 && r < 8 && c >= 0 && c < 8 && board[r][c] === opposite) {
      r += dr;
      c += dc;
      cnt++;
    }

    if (
      cnt >= 1 &&
      r >= 0 &&
      r < 8 &&
      c >= 0 &&
      c < 8 &&
      board[r][c] === color
    ) {
      return true;
    }
  }

  return false;
}
