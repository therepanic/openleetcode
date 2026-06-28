function updateBoard(board: string[][], click: number[]): string[][] {
  const directions = [
    [-1, -1],
    [-1, 0],
    [-1, 1],
    [0, -1],
    [0, 1],
    [1, -1],
    [1, 0],
    [1, 1],
  ];
  const rows = board.length;
  const cols = board[0].length;
  const r = click[0];
  const c = click[1];

  if (board[r][c] === "M") {
    board[r][c] = "X";
    return board;
  }

  const countMines = (r: number, c: number): number => {
    let count = 0;
    for (const [dr, dc] of directions) {
      const nr = r + dr;
      const nc = c + dc;
      if (
        nr >= 0 &&
        nr < rows &&
        nc >= 0 &&
        nc < cols &&
        board[nr][nc] === "M"
      ) {
        count++;
      }
    }
    return count;
  };

  const reveal = (r: number, c: number): void => {
    if (r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] !== "E") {
      return;
    }
    const mines = countMines(r, c);
    if (mines > 0) {
      board[r][c] = String(mines);
    } else {
      board[r][c] = "B";
      for (const [dr, dc] of directions) {
        reveal(r + dr, c + dc);
      }
    }
  };

  reveal(r, c);
  return board;
}
