function minReorder(n: number, connections: number[][]): number {
  const roads = new Set<string>();
  const graph: number[][] = Array.from({ length: n }, () => []);
  for (const [x, y] of connections) {
    graph[x].push(y);
    graph[y].push(x);
    roads.add(`${x},${y}`);
  }

  const seen: boolean[] = new Array(n).fill(false);
  seen[0] = true;

  function dfs(node: number): number {
    let ans = 0;
    for (const neighbor of graph[node]) {
      if (!seen[neighbor]) {
        if (roads.has(`${node},${neighbor}`)) {
          ans++;
        }
        seen[neighbor] = true;
        ans += dfs(neighbor);
      }
    }
    return ans;
  }

  return dfs(0);
}
