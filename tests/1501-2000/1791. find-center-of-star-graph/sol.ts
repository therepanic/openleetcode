function findCenter(edges: number[][]): number {
  let [a, b] = edges[0];
  let [c, d] = edges[1];
  return a === c || a === d ? a : b;
}
