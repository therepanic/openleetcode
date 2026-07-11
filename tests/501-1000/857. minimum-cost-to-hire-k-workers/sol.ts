function mincostToHireWorkers(
  quality: number[],
  wage: number[],
  k: number,
): number {
  const workers: [number, number][] = [];
  for (let i = 0; i < quality.length; i++) {
    workers.push([wage[i] / quality[i], quality[i]]);
  }
  workers.sort((a, b) => a[0] - b[0]);

  let minCost = Number.MAX_VALUE;
  let currentQualitySum = 0;
  const maxHeap: number[] = [];

  for (const [ratio, q] of workers) {
    currentQualitySum += q;
    maxHeap.push(q);
    maxHeap.sort((a, b) => b - a);

    if (maxHeap.length > k) {
      currentQualitySum -= maxHeap.shift()!;
    }

    if (maxHeap.length === k) {
      minCost = Math.min(minCost, ratio * currentQualitySum);
    }
  }

  return minCost;
}
