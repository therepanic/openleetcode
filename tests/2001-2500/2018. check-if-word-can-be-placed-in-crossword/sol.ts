function placeWordInCrossword(board: string[][], word: string): boolean {
  const canPlace = (segment: string, w: string): boolean => {
    if (segment.length !== w.length) return false;
    for (let i = 0; i < segment.length; i++) {
      if (segment[i] !== " " && segment[i] !== w[i]) return false;
    }
    return true;
  };

  const m = board.length,
    n = board[0].length;
  const reversedWord = word.split("").reverse().join("");

  for (let row of board) {
    const parts = row.join("").split("#");
    for (let part of parts) {
      if (part && (canPlace(part, word) || canPlace(part, reversedWord)))
        return true;
    }
  }

  for (let j = 0; j < n; j++) {
    let col = "";
    for (let i = 0; i < m; i++) col += board[i][j];
    const parts = col.split("#");
    for (let part of parts) {
      if (part && (canPlace(part, word) || canPlace(part, reversedWord)))
        return true;
    }
  }
  return false;
}
