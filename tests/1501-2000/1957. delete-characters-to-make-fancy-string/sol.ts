function makeFancyString(s: string): string {
  if (s.length === 0) return "";
  let result = s[0];
  let last = s[0];
  let count = 1;

  for (let i = 1; i < s.length; i++) {
    if (s[i] !== last) {
      last = s[i];
      count = 0;
    }

    count++;
    if (count > 2) continue;

    result += s[i];
  }

  return result;
}
