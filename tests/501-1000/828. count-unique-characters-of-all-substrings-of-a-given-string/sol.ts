function uniqueLetterString(s: string): number {
  const n = s.length;
  const left = new Array(n).fill(0);
  const right = new Array(n).fill(0);
  const prev = new Array(26).fill(-1);

  for (let i = 0; i < n; i++) {
    const idx = s.charCodeAt(i) - "A".charCodeAt(0);
    left[i] = prev[idx];
    prev[idx] = i;
  }

  prev.fill(n);

  for (let i = n - 1; i >= 0; i--) {
    const idx = s.charCodeAt(i) - "A".charCodeAt(0);
    right[i] = prev[idx];
    prev[idx] = i;
  }

  let ans = 0;
  for (let i = 0; i < n; i++) {
    ans += (i - left[i]) * (right[i] - i);
  }
  return ans;
}
