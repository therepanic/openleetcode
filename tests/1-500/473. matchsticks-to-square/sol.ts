function makesquare(matchsticks: number[]): boolean {
  const total = matchsticks.reduce((a, b) => a + b, 0);
  if (total % 4 !== 0) return false;
  const side = Math.floor(total / 4);

  matchsticks.sort((a, b) => b - a);

  const sides = [0, 0, 0, 0];
  return backtrack(matchsticks, 0, sides, side);
}

function backtrack(
  matchsticks: number[],
  index: number,
  sides: number[],
  side: number,
): boolean {
  if (index === matchsticks.length) {
    return (
      sides[0] === side &&
      sides[1] === side &&
      sides[2] === side &&
      sides[3] === side
    );
  }
  for (let i = 0; i < 4; i++) {
    if (sides[i] + matchsticks[index] <= side) {
      sides[i] += matchsticks[index];
      if (backtrack(matchsticks, index + 1, sides, side)) return true;
      sides[i] -= matchsticks[index];
    }
  }
  return false;
}
