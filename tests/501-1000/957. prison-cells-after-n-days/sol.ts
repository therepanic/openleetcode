function prisonAfterNDays(cells: number[], n: number): number[] {
  n = ((n - 1) % 14) + 1;
  for (let day = 0; day < n; day++) {
    let prev = cells[0];
    for (let i = 1; i < cells.length - 1; i++) {
      const current = cells[i];
      if (prev === cells[i + 1]) {
        cells[i] = 1;
      } else {
        cells[i] = 0;
      }
      prev = current;
    }
    cells[0] = 0;
    cells[cells.length - 1] = 0;
  }
  return cells;
}
