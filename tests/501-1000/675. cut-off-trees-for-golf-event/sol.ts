function cutOffTree(forest: number[][]): number {
  const rows = forest.length;
  const cols = forest[0].length;

  if (forest[0][0] === 0) return -1;

  const trees: [number, number, number][] = [];
  for (let r = 0; r < rows; r++) {
    for (let c = 0; c < cols; c++) {
      if (forest[r][c] > 1) {
        trees.push([forest[r][c], r, c]);
      }
    }
  }

  trees.sort((a, b) => a[0] - b[0]);

  function findShortestPath(
    startRow: number,
    startCol: number,
    targetRow: number,
    targetCol: number,
  ): number {
    const directions: [number, number][] = [
      [-1, 0],
      [0, -1],
      [0, 1],
      [1, 0],
    ];
    const queue: [number, number, number][] = [[startRow, startCol, 0]];
    const visited: Set<string> = new Set();
    visited.add(`${startRow},${startCol}`);

    while (queue.length > 0) {
      const [currRow, currCol, steps] = queue.shift()!;

      if (currRow === targetRow && currCol === targetCol) {
        return steps;
      }

      for (const [dr, dc] of directions) {
        const newRow = currRow + dr;
        const newCol = currCol + dc;

        if (
          newRow >= 0 &&
          newRow < rows &&
          newCol >= 0 &&
          newCol < cols &&
          forest[newRow][newCol] > 0 &&
          !visited.has(`${newRow},${newCol}`)
        ) {
          queue.push([newRow, newCol, steps + 1]);
          visited.add(`${newRow},${newCol}`);
        }
      }
    }

    return -1;
  }

  let totalSteps = 0;
  let currentRow = 0,
    currentCol = 0;

  for (const [, targetRow, targetCol] of trees) {
    const steps = findShortestPath(
      currentRow,
      currentCol,
      targetRow,
      targetCol,
    );
    if (steps === -1) return -1;

    totalSteps += steps;
    currentRow = targetRow;
    currentCol = targetCol;
  }

  return totalSteps;
}
