function constructDistancedSequence(n: number): number[] {
  const result: number[] = new Array(2 * n - 1).fill(0);
  const used: boolean[] = new Array(n + 1).fill(false);
  backtrack(result, used, n, 0);
  return result;
}

function backtrack(
  result: number[],
  used: boolean[],
  n: number,
  index: number,
): boolean {
  let idx = index;
  while (idx < result.length && result[idx] !== 0) {
    idx++;
  }
  if (idx === result.length) {
    return true;
  }

  for (let i = n; i >= 1; i--) {
    if (used[i]) continue;

    if (i === 1) {
      result[idx] = 1;
      used[1] = true;
      if (backtrack(result, used, n, idx + 1)) {
        return true;
      }
      result[idx] = 0;
      used[1] = false;
    } else if (idx + i < result.length && result[idx + i] === 0) {
      result[idx] = i;
      result[idx + i] = i;
      used[i] = true;
      if (backtrack(result, used, n, idx + 1)) {
        return true;
      }
      result[idx] = 0;
      result[idx + i] = 0;
      used[i] = false;
    }
  }

  return false;
}
