function numRookCaptures(board: string[][]): number {
  let pwa = 0;
  for (let i = 0; i < 8; i++) {
    for (let j = 0; j < 8; j++) {
      if (board[i][j] === "R") {
        for (let k = i - 1; k >= 0; k--) {
          if (board[k][j] === "B") {
            break;
          } else if (board[k][j] === "p") {
            pwa++;
            break;
          }
        }
        for (let k = i + 1; k < 8; k++) {
          if (board[k][j] === "B") {
            break;
          } else if (board[k][j] === "p") {
            pwa++;
            break;
          }
        }
        for (let k = j + 1; k < 8; k++) {
          if (board[i][k] === "B") {
            break;
          } else if (board[i][k] === "p") {
            pwa++;
            break;
          }
        }
        for (let k = j - 1; k >= 0; k--) {
          if (board[i][k] === "B") {
            break;
          } else if (board[i][k] === "p") {
            pwa++;
            break;
          }
        }
      }
    }
  }
  return pwa;
}
