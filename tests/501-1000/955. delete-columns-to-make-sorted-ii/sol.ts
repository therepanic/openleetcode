function minDeletionSize(strs: string[]): number {
  const n = strs.length;
  const m = strs[0].length;
  const sortedPairs: boolean[] = new Array(n - 1).fill(false);
  let delCount = 0;

  for (let col = 0; col < m; col++) {
    let bad = false;
    for (let i = 0; i < n - 1; i++) {
      if (!sortedPairs[i] && strs[i][col] > strs[i + 1][col]) {
        bad = true;
        break;
      }
    }

    if (bad) {
      delCount++;
      continue;
    }

    for (let i = 0; i < n - 1; i++) {
      if (!sortedPairs[i] && strs[i][col] < strs[i + 1][col]) {
        sortedPairs[i] = true;
      }
    }

    if (sortedPairs.every((b) => b)) break;
  }

  return delCount;
}
