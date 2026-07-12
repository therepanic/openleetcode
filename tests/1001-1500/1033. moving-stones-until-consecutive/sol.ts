function numMovesStones(a: number, b: number, c: number): number[] {
  const stones = [a, b, c].sort((n1, n2) => n1 - n2);
  const x = stones[0],
    y = stones[1],
    z = stones[2];
  let minMove: number;
  if (z - x === 2) {
    minMove = 0;
  } else if (y - x <= 2 || z - y <= 2) {
    minMove = 1;
  } else {
    minMove = 2;
  }
  const maxMove = z - x - 2;
  return [minMove, maxMove];
}
