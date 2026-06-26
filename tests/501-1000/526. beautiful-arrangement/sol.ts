function countArrangement(n: number): number {
  const visited: boolean[] = new Array(n + 1).fill(false);

  const backtrack = (index: number): number => {
    if (index > n) {
      return 1;
    }
    let count = 0;
    for (let i = 1; i <= n; i++) {
      if (!visited[i] && (i % index === 0 || index % i === 0)) {
        visited[i] = true;
        count += backtrack(index + 1);
        visited[i] = false;
      }
    }
    return count;
  };

  return backtrack(1);
}
