function countPalindromicSubsequence(s: string): number {
  const n = s.length;
  const first = new Array(26).fill(-1);
  const last = new Array(26).fill(-1);

  for (let i = 0; i < n; i++) {
    const c = s.charCodeAt(i) - 97;
    if (first[c] === -1) first[c] = i;
    last[c] = i;
  }

  let ans = 0;
  for (let c = 0; c < 26; c++) {
    if (first[c] !== -1 && last[c] - first[c] > 1) {
      let mask = 0;
      for (let i = first[c] + 1; i < last[c]; i++) {
        mask |= 1 << (s.charCodeAt(i) - 97);
      }
      ans += mask.toString(2).split("1").length - 1;
    }
  }
  return ans;
}
