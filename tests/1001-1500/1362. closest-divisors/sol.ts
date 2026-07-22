function closestDivisors(num: number): number[] {
  const start = Math.floor(Math.sqrt(num + 2));
  for (let d = start; d >= 1; d--) {
    if ((num + 1) % d === 0) {
      return [d, Math.floor((num + 1) / d)];
    }
    if ((num + 2) % d === 0) {
      return [d, Math.floor((num + 2) / d)];
    }
  }
  return [];
}
