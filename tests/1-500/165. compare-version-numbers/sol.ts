function compareVersion(version1: string, version2: string): number {
  const a = version1.split(".");
  const b = version2.split(".");
  const n = Math.max(a.length, b.length);
  for (let i = 0; i < n; i++) {
    const x = i < a.length ? parseInt(a[i], 10) : 0;
    const y = i < b.length ? parseInt(b[i], 10) : 0;
    if (x < y) return -1;
    if (x > y) return 1;
  }
  return 0;
}
