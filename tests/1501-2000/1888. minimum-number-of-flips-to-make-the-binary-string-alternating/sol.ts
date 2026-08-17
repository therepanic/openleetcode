function minFlips(s: string): number {
  const n = s.length;
  const t = s + s;
  let ans = n;
  let mis0 = 0;

  for (let i = 0; i < 2 * n; i++) {
    const expected0 = i % 2 === 0 ? "0" : "1";
    if (t[i] !== expected0) {
      mis0++;
    }

    if (i >= n) {
      const left = i - n;
      const expLeft = left % 2 === 0 ? "0" : "1";
      if (t[left] !== expLeft) {
        mis0--;
      }
    }

    if (i >= n - 1) {
      const mis1 = n - mis0;
      ans = Math.min(ans, Math.min(mis0, mis1));
    }
  }

  return ans;
}
