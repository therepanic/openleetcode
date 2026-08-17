function findLatestStep(arr: number[], m: number): number {
  const n = arr.length;
  if (m === n) return m;

  const groups: number[] = new Array(n + 2).fill(0);
  let latestStep = -1;

  for (let i = 0; i < n; i++) {
    const idx = arr[i];
    const left = groups[idx - 1];
    const right = groups[idx + 1];

    if (left === m || right === m) latestStep = i;

    groups[idx - left] = groups[idx + right] = left + right + 1;
  }

  return latestStep;
}
