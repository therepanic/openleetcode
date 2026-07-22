function average(salary: number[]): number {
  const max = Math.max(...salary);
  const min = Math.min(...salary);
  let total = 0.0;
  let count = 0;
  for (const s of salary) {
    if (s !== max && s !== min) {
      total += s;
      count++;
    }
  }
  return total / count;
}
