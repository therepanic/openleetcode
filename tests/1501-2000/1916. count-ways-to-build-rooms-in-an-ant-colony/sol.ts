function waysToBuildRooms(prevRoom: number[]): number {
  const MOD = 1_000_000_007;
  const n = prevRoom.length;
  const tree: number[][] = Array.from({ length: n }, () => []);
  for (let i = 1; i < n; i++) {
    tree[prevRoom[i]].push(i);
  }
  const mod = BigInt(MOD);
  const fact: bigint[] = new Array(n + 1).fill(1n);
  const invFact: bigint[] = new Array(n + 1).fill(1n);
  for (let i = 1; i <= n; i++) fact[i] = (fact[i - 1] * BigInt(i)) % mod;
  invFact[n] = powMod(fact[n], BigInt(MOD - 2), mod);
  for (let i = n; i > 0; i--) invFact[i - 1] = (invFact[i] * BigInt(i)) % mod;
  const ways: bigint[] = new Array(n).fill(0n);
  const size: number[] = new Array(n).fill(0);
  function dfs(node: number) {
    ways[node] = 1n;
    size[node] = 1;
    for (const child of tree[node]) {
      dfs(child);
      const oldSize = size[node];
      size[node] += size[child];
      ways[node] =
        (ways[node] * comb(size[node] - 1, oldSize - 1, fact, invFact, mod)) %
        mod;
      ways[node] = (ways[node] * ways[child]) % mod;
    }
  }
  dfs(0);
  return Number(ways[0]);
}
function comb(
  n: number,
  k: number,
  fact: bigint[],
  invFact: bigint[],
  mod: bigint,
): bigint {
  if (k < 0 || k > n) return 0n;
  return (((fact[n] * invFact[k]) % mod) * invFact[n - k]) % mod;
}
function powMod(a: bigint, b: bigint, mod: bigint): bigint {
  let res = 1n;
  let base = a % mod;
  let exp = b;
  while (exp > 0) {
    if (exp % 2n === 1n) res = (res * base) % mod;
    base = (base * base) % mod;
    exp /= 2n;
  }
  return res;
}
