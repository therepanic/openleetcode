function countVowelPermutation(n: number): number {
  const MOD = 1000000007;
  let a = 1,
    e = 1,
    i = 1,
    o = 1,
    u = 1;
  for (let k = 1; k < n; k++) {
    const na = (e + i + u) % MOD;
    const ne = (a + i) % MOD;
    const ni = (e + o) % MOD;
    const no = i % MOD;
    const nu = (i + o) % MOD;
    a = na;
    e = ne;
    i = ni;
    o = no;
    u = nu;
  }
  return (a + e + i + o + u) % MOD;
}
