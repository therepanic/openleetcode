function minDays(n: number): number {
  let ans = 0;
  let queue: number[] = [n];
  let seen = new Set<number>();
  while (queue.length > 0) {
    let newq: number[] = [];
    for (let x of queue) {
      if (x === 0) return ans;
      seen.add(x);
      if (!seen.has(x - 1)) newq.push(x - 1);
      if (x % 2 === 0 && !seen.has(x / 2)) newq.push(x / 2);
      if (x % 3 === 0 && !seen.has(x / 3)) newq.push(x / 3);
    }
    ans++;
    queue = newq;
  }
  return ans;
}
