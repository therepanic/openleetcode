function checkIfPrerequisite(
  n: number,
  prerequisites: number[][],
  queries: number[][],
): boolean[] {
  const reach = Array.from({ length: n }, () => Array<boolean>(n).fill(false));
  for (const [from, to] of prerequisites) reach[from][to] = true;
  for (let k = 0; k < n; k++)
    for (let i = 0; i < n; i++)
      if (reach[i][k]) for (let j = 0; j < n; j++) reach[i][j] ||= reach[k][j];
  return queries.map(([from, to]) => reach[from][to]);
}
