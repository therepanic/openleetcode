function minSteps(s: string, t: string): number {
  const dic: { [key: string]: number } = {};
  for (const ch of t) {
    dic[ch] = (dic[ch] || 0) + 1;
  }
  for (const ch of s) {
    if (dic[ch] && dic[ch] > 0) {
      dic[ch]--;
    }
  }
  return Object.values(dic).reduce((sum, val) => sum + val, 0);
}
