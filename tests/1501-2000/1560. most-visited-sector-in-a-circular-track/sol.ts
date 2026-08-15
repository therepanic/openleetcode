function mostVisited(n: number, rounds: number[]): number[] {
  const s = rounds[0];
  const e = rounds[rounds.length - 1];
  if (s <= e) {
    const ans: number[] = [];
    for (let i = s; i <= e; i++) ans.push(i);
    return ans;
  } else {
    const ans: number[] = [];
    for (let i = 1; i <= e; i++) ans.push(i);
    for (let i = s; i <= n; i++) ans.push(i);
    return ans;
  }
}
