function solveNQueens(n: number): string[][] {
  const res: string[][] = [];
  const board: string[][] = Array.from({ length: n }, () => Array(n).fill("."));
  const cols = Array(n).fill(false);
  const diag1 = Array(2 * n).fill(false);
  const diag2 = Array(2 * n).fill(false);

  const backtrack = (row: number): void => {
    if (row === n) {
      res.push(board.map((r) => r.join("")));
      return;
    }
    for (let col = 0; col < n; col++) {
      const d1 = row + col;
      const d2 = row - col + n - 1;
      if (cols[col] || diag1[d1] || diag2[d2]) continue;
      cols[col] = true;
      diag1[d1] = true;
      diag2[d2] = true;
      board[row][col] = "Q";
      backtrack(row + 1);
      board[row][col] = ".";
      cols[col] = false;
      diag1[d1] = false;
      diag2[d2] = false;
    }
  };

  backtrack(0);
  return res;
}
