function numberOfUniqueGoodSubsequences(binary: string): number {
  let a = 0,
    b = 0,
    z = 0;
  const mod = 1000000007;
  for (const c of binary) {
    if (c === "1") {
      b = (a + b + 1) % mod;
    } else {
      a = (a + b) % mod;
      z = 1;
    }
  }
  return (a + b + z) % mod;
}
