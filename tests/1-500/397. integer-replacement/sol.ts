function integerReplacement(n: number): number {
  let x = n;
  let steps = 0;
  while (x !== 1) {
    if (x % 2 === 0) {
      x = Math.floor(x / 2);
    } else if (x === 3 || Math.floor(x / 2) % 2 === 0) {
      x -= 1;
    } else {
      x += 1;
    }
    steps += 1;
  }
  return steps;
}
