function grayCode(n: number): number[] {
  const total = 1 << n;
  const res: number[] = [];
  for (let i = 0; i < total; i++) res.push(i ^ (i >> 1));
  return res;
}
