function tictactoe(moves: number[][]): string {
  const board: string[][] = Array.from({ length: 3 }, () => Array(3).fill(""));
  let isA = true;
  for (const [r, c] of moves) {
    board[r][c] = isA ? "X" : "O";
    isA = !isA;
  }

  for (let i = 0; i < 3; i++) {
    if (
      board[i][0] &&
      board[i][0] === board[i][1] &&
      board[i][1] === board[i][2]
    ) {
      return board[i][0] === "X" ? "A" : "B";
    }
    if (
      board[0][i] &&
      board[0][i] === board[1][i] &&
      board[1][i] === board[2][i]
    ) {
      return board[0][i] === "X" ? "A" : "B";
    }
  }

  if (
    board[1][1] &&
    ((board[0][0] === board[1][1] && board[1][1] === board[2][2]) ||
      (board[0][2] === board[1][1] && board[1][1] === board[2][0]))
  ) {
    return board[1][1] === "X" ? "A" : "B";
  }

  return moves.length === 9 ? "Draw" : "Pending";
}
