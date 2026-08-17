function busiestServers(
  k: number,
  arrival: number[],
  load: number[],
): number[] {
  const available: number[] = [];
  for (let i = 0; i < k; i++) available.push(i);
  available.sort((a, b) => a - b);
  const busy: [number, number][] = [];
  const res: number[] = new Array(k).fill(0);
  for (let i = 0; i < arrival.length; i++) {
    const a = arrival[i];
    while (busy.length > 0 && busy[0][0] <= a) {
      const x = busy.shift()![1];
      available.push(i + ((((x - i) % k) + k) % k));
      available.sort((a, b) => a - b);
    }
    if (available.length > 0) {
      const j = available.shift()! % k;
      busy.push([a + load[i], j]);
      busy.sort((a, b) => a[0] - b[0]);
      res[j]++;
    }
  }
  const max = Math.max(...res);
  const ans: number[] = [];
  for (let i = 0; i < k; i++) {
    if (res[i] === max) ans.push(i);
  }
  return ans;
}
