function escapeGhosts(ghosts: number[][], target: number[]): boolean {
  const a: number[] = [];
  for (const i of ghosts) {
    a.push(Math.abs(i[0] - target[0]) + Math.abs(i[1] - target[1]));
  }

  const z = Math.abs(target[0] - 0) + Math.abs(target[1] - 0);

  let ans = true;
  for (const i of a) {
    if (i <= z) {
      ans = false;
    }
  }

  return ans;
}
