function repeatedSubstringPattern(s: string): boolean {
  const doubled = (s + s).substring(1, 2 * s.length - 1);
  return doubled.includes(s);
}
