function queensAttacktheKing(queens: number[][], king: number[]): number[][] {
  const board: boolean[][] = Array.from({ length: 8 }, () =>
    Array(8).fill(false),
  );
  for (const [r, c] of queens) {
    board[r][c] = true;
  }

  const directions: [number, number][] = [
    [-1, 0],
    [1, 0],
    [0, 1],
    [0, -1],
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1],
  ];

  const ans: number[][] = [];
  for (const [dr, dc] of directions) {
    let r = king[0],
      c = king[1];
    while (r >= 0 && r < 8 && c >= 0 && c < 8) {
      r += dr;
      c += dc;
      if (r < 0 || r >= 8 || c < 0 || c >= 8) break;
      if (board[r][c]) {
        ans.push([r, c]);
        break;
      }
    }
  }
  return ans;
}
