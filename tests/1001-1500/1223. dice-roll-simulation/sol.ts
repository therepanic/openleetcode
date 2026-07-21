function dieSimulator(n: number, rollMax: number[]): number {
  const MOD = 1_000_000_007;
  const faces = 6;

  const f: number[][] = Array.from({ length: n }, () => Array(faces).fill(0));
  const s: number[] = Array(n).fill(0);

  for (let j = 0; j < faces; j++) {
    f[0][j] = 1;
  }
  s[0] = faces;

  for (let i = 1; i < n; i++) {
    for (let j = 0; j < faces; j++) {
      const maxRepeat = rollMax[j];
      let res = s[i - 1];

      if (i > maxRepeat) {
        res -= s[i - maxRepeat - 1] - f[i - maxRepeat - 1][j];
      } else if (i === maxRepeat) {
        res -= 1;
      }

      f[i][j] = ((res % MOD) + MOD) % MOD;
    }

    let sum = 0;
    for (let j = 0; j < faces; j++) {
      sum = (sum + f[i][j]) % MOD;
    }
    s[i] = sum;
  }

  return s[n - 1];
}
