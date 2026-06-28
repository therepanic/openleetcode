function movesToChessboard(board: number[][]): number {
  const n = board.length;

  const fn = (vals: number[]): number => {
    let total = 0;
    let odd = 0;
    for (let i = 0; i < vals.length; i++) {
      if (vals[0] === vals[i]) {
        total++;
        if ((i & 1) === 1) odd++;
      } else if ((vals[0] ^ vals[i]) !== (1 << n) - 1) {
        return Infinity;
      }
    }
    let ans = Infinity;
    if (n <= 2 * total && 2 * total <= n + 1) {
      ans = Math.min(ans, odd);
    }
    if (n - 1 <= 2 * total && 2 * total <= n) {
      ans = Math.min(ans, total - odd);
    }
    return ans;
  };

  const rows: number[] = new Array(n).fill(0);
  const cols: number[] = new Array(n).fill(0);
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      if (board[i][j] === 1) {
        rows[i] ^= 1 << j;
        cols[j] ^= 1 << i;
      }
    }
  }
  const ans = fn(rows) + fn(cols);
  return ans < Infinity ? ans : -1;
}
