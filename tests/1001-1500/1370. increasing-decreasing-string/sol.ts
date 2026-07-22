function sortString(s: string): string {
  if (s.length === 0) return "";
  const counts: number[] = new Array(26).fill(0);
  for (const c of s) {
    counts[c.charCodeAt(0) - 97]++;
  }
  let ans = "";
  let added: boolean;
  do {
    added = false;
    for (let i = 0; i < 26; i++) {
      if (counts[i] > 0) {
        ans += String.fromCharCode(97 + i);
        counts[i]--;
        added = true;
      }
    }
    for (let i = 25; i >= 0; i--) {
      if (counts[i] > 0) {
        ans += String.fromCharCode(97 + i);
        counts[i]--;
        added = true;
      }
    }
  } while (added);
  return ans;
}
