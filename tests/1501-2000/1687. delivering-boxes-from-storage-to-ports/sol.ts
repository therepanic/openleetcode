function boxDelivering(
  boxes: number[][],
  portsCount: number,
  maxBoxes: number,
  maxWeight: number,
): number {
  const n = boxes.length;
  const ports: number[] = new Array(n + 1).fill(0);
  const weights: number[] = new Array(n + 1).fill(0);
  for (let i = 0; i < n; i++) {
    ports[i + 1] = boxes[i][0];
    weights[i + 1] = boxes[i][1];
  }
  const prefixWeights: number[] = new Array(n + 1).fill(0);
  for (let i = 1; i <= n; i++) {
    prefixWeights[i] = prefixWeights[i - 1] + weights[i];
  }
  const portsCnt: number[] = new Array(n + 2).fill(0);
  for (let i = 2; i <= n; i++) {
    portsCnt[i] = portsCnt[i - 1] + (ports[i] !== ports[i - 1] ? 1 : 0);
  }
  portsCnt[n + 1] = portsCnt[n];
  const dp: number[] = new Array(n + 1).fill(0);
  const queue: number[] = [0];
  let left = 0;
  for (let i = 1; i <= n; i++) {
    while (
      i - left > maxBoxes ||
      prefixWeights[i] - prefixWeights[left] > maxWeight
    ) {
      if (queue.length > 0 && queue[0] === left) {
        queue.shift();
      }
      left++;
    }
    dp[i] = 2 + portsCnt[i] + (dp[queue[0]] - portsCnt[queue[0] + 1]);
    const idx = dp[i] - portsCnt[i + 1];
    while (
      queue.length > 0 &&
      dp[queue[queue.length - 1]] - portsCnt[queue[queue.length - 1] + 1] >= idx
    ) {
      queue.pop();
    }
    queue.push(i);
  }
  return dp[n];
}
