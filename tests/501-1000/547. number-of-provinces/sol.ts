function findCircleNum(isConnected: number[][]): number {
  const n = isConnected.length;
  const visited: boolean[] = new Array(n).fill(false);
  let count = 0;

  const dfs = (city: number): void => {
    for (let neighbor = 0; neighbor < n; neighbor++) {
      if (isConnected[city][neighbor] === 1 && !visited[neighbor]) {
        visited[neighbor] = true;
        dfs(neighbor);
      }
    }
  };

  for (let city = 0; city < n; city++) {
    if (!visited[city]) {
      visited[city] = true;
      dfs(city);
      count++;
    }
  }

  return count;
}
