function makeStringSorted(s: string): number {
  const MOD = 1000000007n;
  const n = s.length;
  const fac: number[] = Array(n + 1).fill(1);
  const invFac: number[] = Array(n + 1).fill(1);

  for (let i = 1; i <= n; i++) {
    fac[i] = Number((BigInt(fac[i - 1]) * BigInt(i)) % MOD);
  }
  invFac[n] = modPow(fac[n], Number(MOD) - 2);
  for (let i = n; i > 0; i--) {
    invFac[i - 1] = Number((BigInt(invFac[i]) * BigInt(i)) % MOD);
  }

  const freq: number[] = Array(26).fill(0);
  for (let i = 0; i < n; i++) {
    freq[s.charCodeAt(i) - 97]++;
  }

  let ans = 0;
  for (let i = 0; i < n; i++) {
    let smallRight = 0;
    for (let j = 0; j < s.charCodeAt(i) - 97; j++) {
      smallRight += freq[j];
    }

    const rem = n - i - 1;
    let temp = 1;
    temp = Number((BigInt(temp) * BigInt(fac[rem])) % MOD);
    temp = Number((BigInt(temp) * BigInt(smallRight)) % MOD);

    for (const x of freq) {
      if (x > 1) {
        temp = Number((BigInt(temp) * BigInt(invFac[x])) % MOD);
      }
    }

    freq[s.charCodeAt(i) - 97]--;
    ans = Number((BigInt(ans) + BigInt(temp)) % MOD);
  }

  return ans;
}

function modPow(x: number, n: number): number {
  const MOD = 1000000007n;
  if (x === 1 || n === 0) return 1;
  if (n === 1) return Number(BigInt(x) % MOD);
  if (n % 2 === 1) {
    return Number(
      (BigInt(x) *
        BigInt(
          modPow(Number((BigInt(x) * BigInt(x)) % MOD), Math.floor(n / 2)),
        )) %
        MOD,
    );
  }
  return modPow(Number((BigInt(x) * BigInt(x)) % MOD), Math.floor(n / 2));
}
