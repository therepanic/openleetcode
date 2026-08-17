function maxProduct(s: string): number {
  const n = s.length;

  // Manacher (odd length only)
  const d: number[] = new Array(n).fill(0);
  let l = 0;
  let r = -1;

  for (let i = 0; i < n; i++) {
    let k: number;
    if (i > r) {
      k = 1;
    } else {
      k = Math.min(d[l + r - i], r - i + 1);
    }

    while (i - k >= 0 && i + k < n && s[i - k] === s[i + k]) {
      k++;
    }

    d[i] = k;

    if (i + k - 1 > r) {
      l = i - k + 1;
      r = i + k - 1;
    }
  }

  // left[i] = max palindrome ending at i
  const left: number[] = new Array(n).fill(0);

  for (let i = 0; i < n; i++) {
    const radius = d[i];
    const length = 2 * radius - 1;
    const end = i + radius - 1;
    left[end] = Math.max(left[end], length);
  }

  // propagate backwards (reduce by 2)
  for (let i = n - 2; i >= 0; i--) {
    left[i] = Math.max(left[i], left[i + 1] - 2);
  }

  // prefix max
  for (let i = 1; i < n; i++) {
    left[i] = Math.max(left[i], left[i - 1]);
  }

  // right[i] = max palindrome starting at i
  const right: number[] = new Array(n).fill(0);

  for (let i = 0; i < n; i++) {
    const radius = d[i];
    const length = 2 * radius - 1;
    const start = i - radius + 1;
    right[start] = Math.max(right[start], length);
  }

  // propagate forward (reduce by 2)
  for (let i = 1; i < n; i++) {
    right[i] = Math.max(right[i], right[i - 1] - 2);
  }

  // suffix max
  for (let i = n - 2; i >= 0; i--) {
    right[i] = Math.max(right[i], right[i + 1]);
  }

  // try all splits
  let ans = 0;
  for (let i = 0; i < n - 1; i++) {
    ans = Math.max(ans, left[i] * right[i + 1]);
  }

  return ans;
}
