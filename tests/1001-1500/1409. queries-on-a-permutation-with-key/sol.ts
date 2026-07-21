function processQueries(queries: number[], m: number): number[] {
  const ans: number[] = [];
  const arr: number[] = [];
  for (let i = 1; i <= m; i++) {
    arr.push(i);
  }
  for (const x of queries) {
    const idx = arr.indexOf(x);
    ans.push(idx);
    arr.splice(idx, 1);
    arr.unshift(x);
  }
  return ans;
}
