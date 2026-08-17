function earliestAndLatest(
  n: number,
  firstPlayer: number,
  secondPlayer: number,
): number[] {
  return dfs(n, firstPlayer, secondPlayer);
}

function dfs(n: number, p1: number, p2: number): number[] {
  if (p1 + p2 === n + 1) return [1, 1];
  if (p1 > p2) {
    [p1, p2] = [p2, p1];
  }
  if (n <= 4) return [2, 2];

  const m = Math.floor((n + 1) / 2);
  let minR = Number.MAX_SAFE_INTEGER;
  let maxR = Number.MIN_SAFE_INTEGER;

  if (p1 - 1 > n - p2) {
    const t = n + 1 - p1;
    p1 = n + 1 - p2;
    p2 = t;
  }

  if (p2 * 2 <= n + 1) {
    const a = p1 - 1;
    const b = p2 - p1 - 1;
    for (let i = 0; i <= a; i++) {
      for (let j = 0; j <= b; j++) {
        const r = dfs(m, i + 1, i + j + 2);
        minR = Math.min(minR, r[0] + 1);
        maxR = Math.max(maxR, r[1] + 1);
      }
    }
  } else {
    const p4 = n + 1 - p2;
    const a = p1 - 1;
    const b = p4 - p1 - 1;
    const c = p2 - p4 - 1;
    for (let i = 0; i <= a; i++) {
      for (let j = 0; j <= b; j++) {
        const offset = i + j + 1 + Math.floor((c + 1) / 2) + 1;
        const r = dfs(m, i + 1, offset);
        minR = Math.min(minR, r[0] + 1);
        maxR = Math.max(maxR, r[1] + 1);
      }
    }
  }

  return [minR, maxR];
}
