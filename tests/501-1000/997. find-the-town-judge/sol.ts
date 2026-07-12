function findJudge(n: number, trust: number[][]): number {
  const indegree = new Array(n + 1).fill(0);
  const outdegree = new Array(n + 1).fill(0);
  for (const [a, b] of trust) {
    outdegree[a]++;
    indegree[b]++;
  }
  for (let i = 1; i <= n; i++) {
    if (outdegree[i] === 0 && indegree[i] === n - 1) {
      return i;
    }
  }
  return -1;
}
