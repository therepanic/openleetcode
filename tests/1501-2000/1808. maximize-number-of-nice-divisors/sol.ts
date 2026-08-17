function maxNiceDivisors(primeFactors: number): number {
  const MOD = 1_000_000_007;
  if (primeFactors === 1) return 1;
  const q = Math.floor(primeFactors / 3);
  const r = primeFactors % 3;
  const pow = (a: number, b: number): number => {
    let res = 1;
    while (b > 0) {
      if (b % 2 === 1)
        res = Number(
          (BigInt(Math.trunc(res)) * BigInt(Math.trunc(a))) % BigInt(MOD),
        );
      a = Number((BigInt(Math.trunc(a)) * BigInt(Math.trunc(a))) % BigInt(MOD));
      b = Math.floor(b / 2);
    }
    return res;
  };
  if (r === 0) return pow(3, q);
  else if (r === 1) return Number((BigInt(pow(3, q - 1)) * 4n) % BigInt(MOD));
  else return Number((BigInt(pow(3, q)) * 2n) % BigInt(MOD));
}
