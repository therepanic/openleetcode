function getWinner(arr: number[], k: number): number {
  let candidate = arr[0];
  let streak = 0;
  for (let i = 1; i < arr.length; i++) {
    if (candidate > arr[i]) {
      streak++;
    } else {
      candidate = arr[i];
      streak = 1;
    }
    if (streak === k) return candidate;
  }
  return candidate;
}
