function numSimilarGroups(strs: string[]): number {
  const checkSimilarity = (str1: string, str2: string): boolean => {
    let diff = 0;
    for (let i = 0; i < str1.length; i++) {
      if (str1[i] !== str2[i]) {
        diff++;
      }
    }
    return diff === 0 || diff === 2;
  };

  const dfs = (
    node: number,
    matrix: number[][],
    visited: Set<number>,
  ): void => {
    if (visited.has(node)) {
      return;
    }
    visited.add(node);
    for (const nei of matrix[node]) {
      if (!visited.has(nei)) {
        dfs(nei, matrix, visited);
      }
    }
  };

  const n = strs.length;
  const matrix: number[][] = Array.from({ length: n }, () => []);

  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      if (checkSimilarity(strs[i], strs[j])) {
        matrix[i].push(j);
        matrix[j].push(i);
      }
    }
  }

  let count = 0;
  const visited = new Set<number>();
  for (let start = 0; start < n; start++) {
    if (!visited.has(start)) {
      dfs(start, matrix, visited);
      count++;
    }
  }

  return count;
}
