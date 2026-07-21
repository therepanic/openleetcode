function canMakePaliQueries(s: string, queries: number[][]): boolean[] {
  const n = s.length;
  const prefix: number[] = new Array(n + 1).fill(0);

  for (let i = 0; i < n; i++) {
    const bit = 1 << (s.charCodeAt(i) - "a".charCodeAt(0));
    prefix[i + 1] = prefix[i] ^ bit;
  }

  const res: boolean[] = [];

  for (const [left, right, ki] of queries) {
    const mask = prefix[right + 1] ^ prefix[left];
    const oddCount = mask.toString(2).split("0").join("").length;

    if (oddCount <= 1 || ki >= Math.floor(oddCount / 2)) {
      res.push(true);
    } else {
      res.push(false);
    }
  }

  return res;
}
