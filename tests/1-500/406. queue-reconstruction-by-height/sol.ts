function reconstructQueue(people: number[][]): number[][] {
  people.sort((a, b) => (a[0] !== b[0] ? b[0] - a[0] : a[1] - b[1]));
  const q: number[][] = [];
  for (const p of people) {
    q.splice(p[1], 0, p);
  }
  return q;
}
