function kthSmallestPath(destination: number[], k: number): string {
  let rows = destination[0];
  let cols = destination[1];
  let path: string[] = [];
  let kLocal = k - 1;

  while (rows > 0 || cols > 0) {
    let pathsWithH = 0;
    if (cols > 0) {
      pathsWithH = combination(rows + cols - 1, cols - 1);
    }

    if (kLocal < pathsWithH) {
      path.push("H");
      cols--;
    } else {
      path.push("V");
      kLocal -= pathsWithH;
      rows--;
    }
  }
  return path.join("");
}

function combination(n: number, r: number): number {
  if (r === 0 || r === n) return 1;
  r = Math.min(r, n - r);
  let result = 1;
  for (let i = 1; i <= r; i++) {
    result = (result * (n - r + i)) / i;
  }
  return result;
}
