function canBeEqual(target: number[], arr: number[]): boolean {
  const counts: number[] = new Array(1001).fill(0);

  for (let i = 0; i < target.length; i++) {
    counts[target[i]]++;
    counts[arr[i]]--;
  }

  return counts.every((c) => c === 0);
}
