function primePalindrome(n: number): number {
  function isPrime(num: number): boolean {
    if (num < 2) return false;
    if (num % 2 === 0) return num === 2;
    for (let i = 3; i * i <= num; i += 2) {
      if (num % i === 0) return false;
    }
    return true;
  }

  if (n >= 8 && n <= 11) return 11;

  while (true) {
    const s = n.toString();
    if (s.length % 2 === 0 && n > 11) {
      n = Math.pow(10, s.length) + 1;
      continue;
    }
    if (s === s.split("").reverse().join("") && isPrime(n)) {
      return n;
    }
    n++;
    if (n > 2 && n % 2 === 0) n++;
  }
}
