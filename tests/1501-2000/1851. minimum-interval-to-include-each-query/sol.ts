function minInterval(intervals: number[][], queries: number[]): number[] {
  intervals.sort((a, b) => a[0] - b[0]);
  const minHeap: [number, number][] = [];
  const res: { [key: number]: number } = {};
  let i = 0;
  const sortedQueries = [...queries].sort((a, b) => a - b);
  for (const q of sortedQueries) {
    while (i < intervals.length && intervals[i][0] <= q) {
      const [l, r] = intervals[i];
      minHeap.push([r - l + 1, r]);
      minHeap.sort((a, b) => a[0] - b[0]);
      i++;
    }
    while (minHeap.length > 0 && minHeap[0][1] < q) {
      minHeap.shift();
    }
    res[q] = minHeap.length === 0 ? -1 : minHeap[0][0];
  }
  return queries.map((q) => res[q]);
}
