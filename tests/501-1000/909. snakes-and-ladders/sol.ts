function snakesAndLadders(board: number[][]): number {
  const n = board.length;
  const minRolls: number[] = new Array(n * n + 1).fill(-1);
  const q: number[] = [1];
  minRolls[1] = 0;

  while (q.length > 0) {
    const x = q.shift()!;
    for (let i = 1; i <= 6; i++) {
      const t = x + i;
      if (t > n * n) break;
      const row = Math.floor((t - 1) / n);
      const col = (t - 1) % n;
      const r = n - 1 - row;
      const c = row % 2 === 1 ? n - 1 - col : col;
      const v = board[r][c];
      const y = v > 0 ? v : t;
      if (y === n * n) return minRolls[x] + 1;
      if (minRolls[y] === -1) {
        minRolls[y] = minRolls[x] + 1;
        q.push(y);
      }
    }
  }
  return -1;
}
