function findSmallestSetOfVertices(n: number, edges: number[][]): number[] {
  const hasIncoming: boolean[] = new Array(n).fill(false);
  for (const edge of edges) {
    hasIncoming[edge[1]] = true;
  }
  const result: number[] = [];
  for (let i = 0; i < n; i++) {
    if (!hasIncoming[i]) {
      result.push(i);
    }
  }
  return result;
}
