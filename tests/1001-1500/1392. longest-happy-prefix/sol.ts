function longestPrefix(s: string): string {
  const n = s.length;
  const prefix: number[] = new Array(n).fill(0);
  let matched = 0;
  for (let i = 1; i < n; i++) {
    while (matched > 0 && s[i] !== s[matched]) {
      matched = prefix[matched - 1];
    }
    if (s[i] === s[matched]) {
      matched++;
    }
    prefix[i] = matched;
  }
  return s.substring(0, prefix[n - 1]);
}
