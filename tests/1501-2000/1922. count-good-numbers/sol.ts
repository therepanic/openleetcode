function countGoodNumbers(n: number): number {
  const mod = 1000000007;
  const evenPositions = Math.floor((n + 1) / 2);
  const oddPositions = Math.floor(n / 2);

  const evenWays = chakraPower(5, evenPositions, mod);
  const oddWays = chakraPower(4, oddPositions, mod);

  return Number((BigInt(evenWays) * BigInt(oddWays)) % BigInt(mod));
}

function chakraPower(base: number, power: number, mod: number): number {
  let result = 1n;
  let b = BigInt(base) % BigInt(mod);
  let p = BigInt(power);
  while (p > 0) {
    if (p % 2n === 1n) {
      result = (result * b) % BigInt(mod);
    }
    b = (b * b) % BigInt(mod);
    p /= 2n;
  }
  return Number(result);
}
