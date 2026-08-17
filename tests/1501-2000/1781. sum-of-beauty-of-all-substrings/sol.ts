function beautySum(s: string): number {
  const n = s.length;
  let sumOfBeauty = 0;
  for (let i = 0; i < n; i++) {
    const freq = new Array(26).fill(0);
    for (let j = i; j < n; j++) {
      freq[s.charCodeAt(j) - 97]++;
      let maxi = -1;
      let mini = Number.MAX_SAFE_INTEGER;
      for (const diff of freq) {
        if (diff > 0) {
          maxi = Math.max(maxi, diff);
          mini = Math.min(mini, diff);
        }
      }
      sumOfBeauty += maxi - mini;
    }
  }
  return sumOfBeauty;
}
