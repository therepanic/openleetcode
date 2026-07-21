function numOfBurgers(tomatoSlices: number, cheeseSlices: number): number[] {
  if ((tomatoSlices - 2 * cheeseSlices) % 2 !== 0) {
    return [];
  }

  const x = (tomatoSlices - 2 * cheeseSlices) / 2;
  const y = cheeseSlices - x;

  if (x < 0 || y < 0) {
    return [];
  }

  return [x, y];
}
