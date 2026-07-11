function atMostNGivenDigitSet(digits: string[], n: number): number {
  const d = digits.length;
  const s = n.toString();
  const k = s.length;

  let ans: number;
  if (d === 1) {
    ans = k - 1;
  } else {
    ans = Math.floor((Math.pow(d, k) - d) / (d - 1));
  }

  for (let i = 0; i < k; i++) {
    const ch = s[i];
    let cnt = 0;
    for (const digit of digits) {
      if (digit < ch) {
        cnt++;
      }
    }
    ans += cnt * Math.pow(d, k - i - 1);

    if (!digits.includes(ch)) {
      break;
    }
    if (i === k - 1) {
      ans++;
    }
  }

  return ans;
}
