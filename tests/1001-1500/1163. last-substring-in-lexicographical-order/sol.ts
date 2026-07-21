function lastSubstring(s: string): string {
  let i = 0,
    j = 1,
    k = 0;
  const n = s.length;
  while (j + k < n) {
    if (s[i + k] === s[j + k]) {
      k++;
      continue;
    } else if (s[i + k] > s[j + k]) {
      j = j + k + 1;
    } else {
      i = Math.max(i + k + 1, j);
      j = i + 1;
    }
    k = 0;
  }
  return s.substring(i);
}
