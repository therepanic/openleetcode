function numberOfLines(widths: number[], s: string): number[] {
  let lines = 1;
  let current = 0;
  for (const c of s) {
    const w = widths[c.charCodeAt(0) - 97];
    if (current + w > 100) {
      lines++;
      current = w;
    } else {
      current += w;
    }
  }
  return [lines, current];
}
