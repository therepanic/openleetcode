const MOD = 1000000007n;
const isPrime: boolean[] = new Array(101).fill(true);
const prefixPrime: number[] = new Array(101).fill(0);

isPrime[0] = false;
isPrime[1] = false;
for (let i = 2; i * i <= 100; i++) {
  if (isPrime[i]) {
    for (let j = i * i; j <= 100; j += i) {
      isPrime[j] = false;
    }
  }
}
for (let i = 2; i <= 100; i++) {
  prefixPrime[i] = prefixPrime[i - 1] + (isPrime[i] ? 1 : 0);
}

function numPrimeArrangements(n: number): number {
  const x = prefixPrime[n];
  const y = n - x;
  let proX = 1n;
  let proY = 1n;

  for (let i = 2; i <= x; i++) {
    proX = (proX * BigInt(i)) % MOD;
  }
  for (let i = 2; i <= y; i++) {
    proY = (proY * BigInt(i)) % MOD;
  }

  return Number((proX * proY) % MOD);
}
