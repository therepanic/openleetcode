function isValidSudoku(board: string[][]): boolean {
  const rows = Array.from({ length: 9 }, () => Array(9).fill(false));
  const cols = Array.from({ length: 9 }, () => Array(9).fill(false));
  const boxes = Array.from({ length: 9 }, () => Array(9).fill(false));

  for (let i = 0; i < 9; i++) {
    for (let j = 0; j < 9; j++) {
      const cell = board[i][j];
      if (cell === ".") continue;
      const num = cell.charCodeAt(0) - "1".charCodeAt(0);
      const box = Math.floor(i / 3) * 3 + Math.floor(j / 3);
      if (rows[i][num] || cols[j][num] || boxes[box][num]) {
        return false;
      }
      rows[i][num] = true;
      cols[j][num] = true;
      boxes[box][num] = true;
    }
  }

  return true;
}
