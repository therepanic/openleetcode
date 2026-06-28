function isBipartite(graph: number[][]): boolean {
  const N: number = graph.length;
  const colors: number[] = new Array(N).fill(-1);

  function checkBipartite(u: number, currColor: number): boolean {
    colors[u] = currColor;
    for (const v of graph[u]) {
      if (colors[v] === -1) {
        if (!checkBipartite(v, 1 - currColor)) {
          return false;
        }
      } else {
        if (colors[v] === currColor) {
          return false;
        }
      }
    }
    return true;
  }

  for (let u = 0; u < N; u++) {
    if (colors[u] === -1) {
      if (!checkBipartite(u, 0)) {
        return false;
      }
    }
  }
  return true;
}
