function findKthNumber(n: number, k: number): number {
  return solve(0, n, k);
}

function solve(current: number, n: number, k: number): number {
  if (k === 0) {
    return Math.floor(current / 10);
  }

  const start = Math.max(current, 1);
  for (let i = start; i < current + 10; i++) {
    const count = numOfChildren(i, i + 1, n);
    if (count >= k) {
      return solve(i * 10, n, k - 1);
    }
    k -= count;
  }

  return -1;
}

function numOfChildren(current: number, neighbour: number, n: number): number {
  if (neighbour > n) {
    if (current > n) {
      return 0;
    }
    return n - current + 1;
  }
  return neighbour - current + numOfChildren(current * 10, neighbour * 10, n);
}
