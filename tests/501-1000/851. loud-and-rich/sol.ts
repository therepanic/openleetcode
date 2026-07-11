function loudAndRich(richer: number[][], quiet: number[]): number[] {
  const n = quiet.length;
  const graph: number[][] = Array.from({ length: n }, () => []);
  for (const [a, b] of richer) {
    graph[b].push(a);
  }

  const answer: number[] = new Array(n).fill(-1);

  const dfs = (i: number): number => {
    if (answer[i] !== -1) return answer[i];
    answer[i] = i;
    for (const nei of graph[i]) {
      const item = dfs(nei);
      if (quiet[item] < quiet[answer[i]]) {
        answer[i] = item;
      }
    }
    return answer[i];
  };

  for (let i = 0; i < n; i++) {
    dfs(i);
  }
  return answer;
}
