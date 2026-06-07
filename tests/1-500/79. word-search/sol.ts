function exist(board: string[][], word: string): boolean {
  const rows = board.length;
  const cols = board[0].length;
  const dfs = (r: number, c: number, idx: number): boolean => {
    if (idx === word.length) return true;
    if (r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] !== word[idx])
      return false;
    const saved = board[r][c];
    board[r][c] = "#";
    const found =
      dfs(r + 1, c, idx + 1) ||
      dfs(r - 1, c, idx + 1) ||
      dfs(r, c + 1, idx + 1) ||
      dfs(r, c - 1, idx + 1);
    board[r][c] = saved;
    return found;
  };
  for (let r = 0; r < rows; r++)
    for (let c = 0; c < cols; c++)
      if (board[r][c] === word[0] && dfs(r, c, 0)) return true;
  return false;
}
