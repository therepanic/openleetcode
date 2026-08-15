function eatenApples(apples: number[], days: number[]): number {
  const heap: [number, number][] = [];
  const n = apples.length;
  let res = 0;
  let day = 0;
  while (heap.length > 0 || day < n) {
    if (day < n && apples[day] > 0) {
      heap.push([day + days[day], apples[day]]);
      heap.sort((a, b) => a[0] - b[0]);
    }
    while (heap.length > 0 && heap[0][0] <= day) {
      heap.shift();
    }
    if (heap.length > 0) {
      const [expire, count] = heap.shift()!;
      res++;
      if (count - 1 > 0) {
        heap.push([expire, count - 1]);
        heap.sort((a, b) => a[0] - b[0]);
      }
    }
    day++;
  }
  return res;
}
