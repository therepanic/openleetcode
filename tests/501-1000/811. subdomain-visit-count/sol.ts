function subdomainVisits(cpdomains: string[]): string[] {
  const freq: Map<string, number> = new Map();
  for (const entry of cpdomains) {
    const [cntStr, dom] = entry.split(" ");
    const cnt = parseInt(cntStr, 10);
    const parts = dom.split(".");
    for (let i = 0; i < parts.length; i++) {
      const sub = parts.slice(i).join(".");
      freq.set(sub, (freq.get(sub) || 0) + cnt);
    }
  }
  const result: string[] = [];
  for (const [d, c] of freq.entries()) {
    result.push(`${c} ${d}`);
  }
  return result;
}
