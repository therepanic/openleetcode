function gardenNoAdj(n: number, paths: number[][]): number[] {
  const graph: Map<number, number[]> = new Map();

  for (const [u, v] of paths) {
    if (!graph.has(u)) graph.set(u, []);
    if (!graph.has(v)) graph.set(v, []);
    graph.get(u)!.push(v);
    graph.get(v)!.push(u);
  }

  for (let node = 1; node <= n; node++) {
    if (!graph.has(node)) {
      graph.set(node, []);
    }
  }

  const answer: number[] = new Array(n + 1).fill(0);

  for (let i = 1; i <= n; i++) {
    const used: Set<number> = new Set();
    for (const nei of graph.get(i)!) {
      used.add(answer[nei]);
    }

    for (let flower = 1; flower <= 4; flower++) {
      if (!used.has(flower)) {
        answer[i] = flower;
        break;
      }
    }
  }

  return answer.slice(1);
}
