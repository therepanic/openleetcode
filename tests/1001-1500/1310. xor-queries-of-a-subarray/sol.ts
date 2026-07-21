function xorQueries(arr: number[], queries: number[][]): number[] {
  const n = arr.length;
  const prefix: number[] = new Array(n + 1).fill(0);
  for (let i = 0; i < n; i++) {
    prefix[i + 1] = prefix[i] ^ arr[i];
  }
  return queries.map(([a, b]) => prefix[b + 1] ^ prefix[a]);
}
