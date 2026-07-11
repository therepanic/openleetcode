function minDeletionSize(strs: string[]): number {
  const rows = strs.length;
  const cols = strs[0].length;
  let deletions = 0;

  for (let c = 0; c < cols; c++) {
    for (let r = 0; r < rows - 1; r++) {
      if (strs[r][c] > strs[r + 1][c]) {
        deletions++;
        break;
      }
    }
  }

  return deletions;
}
