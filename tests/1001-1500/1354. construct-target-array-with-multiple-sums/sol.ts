function isPossible(target: number[]): boolean {
  const values = target.slice();
  let total = values.reduce((sum, value) => sum + value, 0);
  while (true) {
    values.sort((a, b) => b - a);
    const largest = values[0],
      rest = total - largest;
    if (largest === 1 || rest === 1) return true;
    if (rest === 0 || rest >= largest) return false;
    const previous = largest % rest;
    if (previous === 0) return false;
    values[0] = previous;
    total = rest + previous;
  }
}
