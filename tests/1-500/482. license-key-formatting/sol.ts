function licenseKeyFormatting(s: string, k: number): string {
  s = s.replace(/-/g, "").toUpperCase();
  const result: string[] = [];
  for (let i = s.length; i > 0; i -= k) {
    const start = Math.max(0, i - k);
    result.unshift(s.substring(start, i));
  }
  return result.join("-");
}
