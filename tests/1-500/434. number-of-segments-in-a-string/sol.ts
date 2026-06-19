function countSegments(s: string): number {
  let c = 0;
  for (let i = 0; i < s.length; i++) {
    if (s[i] !== " " && (i === 0 || s[i - 1] === " ")) {
      c++;
    }
  }
  return c;
}
