function slidingPuzzle(board: number[][]): number {
  const target = "123450";
  const start = board.flat().join("");

  const neighbors: { [key: number]: number[] } = {
    0: [1, 3],
    1: [0, 2, 4],
    2: [1, 5],
    3: [0, 4],
    4: [1, 3, 5],
    5: [2, 4],
  };

  const queue: [string, number][] = [[start, 0]];
  const visited: Set<string> = new Set();
  visited.add(start);

  while (queue.length > 0) {
    const [state, moves] = queue.shift()!;

    if (state === target) {
      return moves;
    }

    const zeroIndex = state.indexOf("0");

    for (const neighbor of neighbors[zeroIndex]) {
      const newStateArray = state.split("");
      [newStateArray[zeroIndex], newStateArray[neighbor]] = [
        newStateArray[neighbor],
        newStateArray[zeroIndex],
      ];
      const newState = newStateArray.join("");

      if (!visited.has(newState)) {
        visited.add(newState);
        queue.push([newState, moves + 1]);
      }
    }
  }

  return -1;
}
