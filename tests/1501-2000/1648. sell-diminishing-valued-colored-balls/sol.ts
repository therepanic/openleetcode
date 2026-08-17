function maxProfit(inventory: number[], orders: number): number {
  const max = Math.max(...inventory);
  let t = binarySearch(inventory, 0, max, orders);
  let total = 0n;
  let sold = 0n;
  for (const ball of inventory) {
    if (ball > t) {
      const cnt = ball - t;
      total += (BigInt(ball + t + 1) * BigInt(cnt)) / 2n;
      sold += BigInt(cnt);
    }
  }
  const extra = sold - BigInt(orders);
  const res = total - extra * BigInt(t + 1);
  return Number(((res % 1000000007n) + 1000000007n) % 1000000007n);
}

function binarySearch(
  arr: number[],
  left: number,
  right: number,
  target: number,
): number {
  while (left < right) {
    const mid = Math.floor((left + right + 1) / 2);
    let count = 0;
    for (const x of arr) {
      if (x > mid) count += x - mid;
    }
    if (count >= target) {
      left = mid;
    } else {
      right = mid - 1;
    }
  }
  return left;
}
