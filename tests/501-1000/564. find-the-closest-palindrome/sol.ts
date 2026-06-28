function nearestPalindromic(n: string): string {
  const num = BigInt(n);

  const pow10 = (exp: number): bigint => {
    let value = 1n;
    for (let i = 0; i < exp; i++) {
      value *= 10n;
    }
    return value;
  };

  const reverse = (s: string): string => s.split("").reverse().join("");

  const makePalindrome = (prefix: bigint): bigint => {
    const left = prefix.toString();
    const rightSource = n.length % 2 === 0 ? left : left.slice(0, -1);
    return BigInt(left + reverse(rightSource));
  };

  const candidates = new Set<bigint>([
    pow10(n.length - 1) - 1n,
    pow10(n.length) + 1n,
  ]);
  const prefix = BigInt(n.slice(0, Math.floor((n.length + 1) / 2)));
  for (let delta = -1n; delta <= 1n; delta++) {
    if (prefix + delta >= 0n) {
      candidates.add(makePalindrome(prefix + delta));
    }
  }

  let best: bigint | null = null;
  for (const candidate of candidates) {
    if (candidate === num) {
      continue;
    }
    if (
      best === null ||
      (candidate > num ? candidate - num : num - candidate) <
        (best > num ? best - num : num - best) ||
      ((candidate > num ? candidate - num : num - candidate) ===
        (best > num ? best - num : num - best) &&
        candidate < best)
    ) {
      best = candidate;
    }
  }

  return best!.toString();
}
