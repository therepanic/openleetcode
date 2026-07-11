function reachableNodes(
  edges: number[][],
  maxMoves: number,
  n: number,
): number {
  const graph: [number, number][][] = Array.from({ length: n }, () => []);
  const dist: number[] = new Array(n).fill(maxMoves + 1);

  for (const [u, v, cnt] of edges) {
    graph[u].push([v, cnt]);
    graph[v].push([u, cnt]);
  }

  class MinHeap {
    data: [number, number][] = [];
    push(item: [number, number]) {
      this.data.push(item);
      let i = this.data.length - 1;
      while (i > 0) {
        const p = (i - 1) >> 1;
        if (this.data[p][0] <= this.data[i][0]) break;
        [this.data[p], this.data[i]] = [this.data[i], this.data[p]];
        i = p;
      }
    }
    pop(): [number, number] | undefined {
      if (this.data.length === 0) return undefined;
      const top = this.data[0];
      const last = this.data.pop()!;
      if (this.data.length === 0) return top;
      this.data[0] = last;
      let i = 0;
      while (true) {
        let left = i * 2 + 1;
        if (left >= this.data.length) break;
        let right = left + 1;
        let child = left;
        if (
          right < this.data.length &&
          this.data[right][0] < this.data[left][0]
        )
          child = right;
        if (this.data[i][0] <= this.data[child][0]) break;
        [this.data[i], this.data[child]] = [this.data[child], this.data[i]];
        i = child;
      }
      return top;
    }
  }

  dist[0] = 0;
  const heap = new MinHeap();
  heap.push([0, 0]);
  while (true) {
    const curr = heap.pop();
    if (!curr) break;
    const [d, u] = curr;
    if (d > dist[u] || d > maxMoves) continue;
    for (const [v, w] of graph[u]) {
      const newDist = d + w + 1;
      if (newDist < dist[v]) {
        dist[v] = newDist;
        heap.push([newDist, v]);
      }
    }
  }

  const reachableNodes = dist.filter((d) => d <= maxMoves).length;
  let reachableSubnodes = 0;

  for (const [u, v, cnt] of edges) {
    const a = dist[u] > maxMoves ? 0 : Math.min(maxMoves - dist[u], cnt);
    const b = dist[v] > maxMoves ? 0 : Math.min(maxMoves - dist[v], cnt);
    reachableSubnodes += Math.min(a + b, cnt);
  }

  return reachableNodes + reachableSubnodes;
}
