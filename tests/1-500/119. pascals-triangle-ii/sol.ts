function getRow(rowIndex: number): number[] {
  let row = [1];
  for (let i = 0; i < rowIndex; i++) {
    const next = new Array<number>(row.length + 1).fill(1);
    for (let j = 1; j < row.length; j++) {
      next[j] = row[j - 1] + row[j];
    }
    row = next;
  }
  return row;
}
