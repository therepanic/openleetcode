function findMinStep(board: string, hand: string): number {
  const removeSame = (s: string, i: number): string => {
    if (i < 0) return s;
    let left = i,
      right = i;
    while (left > 0 && s[left - 1] === s[i]) left--;
    while (right + 1 < s.length && s[right + 1] === s[i]) right++;
    if (right - left + 1 >= 3) {
      const newS = s.slice(0, left) + s.slice(right + 1);
      return removeSame(newS, left - 1);
    }
    return s;
  };

  hand = hand.split("").sort().join("");
  const q: [string, string, number][] = [[board, hand, 0]];
  const visited = new Set<string>();
  visited.add(`${board}#${hand}`);

  while (q.length) {
    const [currBoard, currHand, step] = q.shift()!;
    for (let i = 0; i <= currBoard.length; i++) {
      for (let j = 0; j < currHand.length; j++) {
        if (j > 0 && currHand[j] === currHand[j - 1]) continue;
        if (i > 0 && currBoard[i - 1] === currHand[j]) continue;

        let pick = false;
        if (i < currBoard.length && currBoard[i] === currHand[j]) pick = true;
        if (
          i > 0 &&
          i < currBoard.length &&
          currBoard[i - 1] === currBoard[i] &&
          currBoard[i] !== currHand[j]
        )
          pick = true;

        if (pick) {
          const newBoard = removeSame(
            currBoard.slice(0, i) + currHand[j] + currBoard.slice(i),
            i,
          );
          const newHand = currHand.slice(0, j) + currHand.slice(j + 1);
          if (!newBoard) return step + 1;
          const key = `${newBoard}#${newHand}`;
          if (!visited.has(key)) {
            visited.add(key);
            q.push([newBoard, newHand, step + 1]);
          }
        }
      }
    }
  }
  return -1;
}
