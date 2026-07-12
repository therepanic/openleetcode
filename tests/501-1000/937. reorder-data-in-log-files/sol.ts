function reorderLogFiles(logs: string[]): string[] {
  const letters: Array<[string, string]> = [];
  const digits: string[] = [];
  for (const log of logs) {
    const split = log.indexOf(" ");
    const ident = log.slice(0, split);
    const rest = log.slice(split + 1);
    if (/^\d/.test(rest)) digits.push(log);
    else letters.push([rest, ident]);
  }
  letters.sort((a, b) => {
    const cmp = a[0].localeCompare(b[0]);
    if (cmp !== 0) return cmp;
    return a[1].localeCompare(b[1]);
  });
  return [...letters.map(([rest, ident]) => `${ident} ${rest}`), ...digits];
}
