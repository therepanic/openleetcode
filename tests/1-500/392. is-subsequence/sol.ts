function isSubsequence(s: string, t: string): boolean {
  let sp = 0,
    tp = 0;
  while (sp < s.length && tp < t.length) {
    if (s[sp] === t[tp]) {
      sp++;
    }
    tp++;
  }
  return sp === s.length;
}
