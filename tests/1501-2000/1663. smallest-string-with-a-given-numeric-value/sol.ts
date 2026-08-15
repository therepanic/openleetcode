function getSmallestString(n: number, k: number): string {
  const res: string[] = new Array(n).fill("a");
  k -= n;

  let i = n - 1;
  while (k > 0) {
    const add = Math.min(25, k);
    res[i] = String.fromCharCode("a".charCodeAt(0) + add);
    k -= add;
    i--;
  }

  return res.join("");
}
