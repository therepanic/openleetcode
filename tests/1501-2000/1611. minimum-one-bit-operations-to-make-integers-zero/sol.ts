function minimumOneBitOperations(n: number): number {
  let highest = 0;
  for (let i = 0; i < 32; i++) {
    if ((n & (1 << i)) !== 0) {
      highest = i;
    }
  }

  let ans = 0;
  let add = true;
  for (let i = highest; i >= 0; i--) {
    if ((n & (1 << i)) !== 0) {
      const val = (1 << (i + 1)) - 1;
      if (add) {
        ans += val;
      } else {
        ans -= val;
      }
      add = !add;
    }
  }

  return ans;
}
