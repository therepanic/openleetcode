function removeStones(stones: number[][]): number {
  const n = stones.length;
  const matrix: number[][] = Array.from({ length: n }, () => []);

  for (let i = 0; i < n; i++) {
    for (let j = i + 1; j < n; j++) {
      if (stones[i][0] === stones[j][0] || stones[i][1] === stones[j][1]) {
        matrix[i].push(j);
        matrix[j].push(i);
      }
    }
  }

  const visited: boolean[] = new Array(n).fill(false);
  let components = 0;

  function dfs(idx: number): void {
    visited[idx] = true;
    for (const nei of matrix[idx]) {
      if (!visited[nei]) {
        dfs(nei);
      }
    }
  }

  for (let i = 0; i < n; i++) {
    if (!visited[i]) {
      components++;
      dfs(i);
    }
  }

  return n - components;
}
