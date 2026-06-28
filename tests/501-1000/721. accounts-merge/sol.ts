function accountsMerge(accounts: string[][]): string[][] {
  const n = accounts.length;
  const location: Map<string, Set<number>> = new Map();
  const content: Set<string>[] = [];

  for (let i = 0; i < n; i++) {
    const name = accounts[i][0];
    if (!location.has(name)) {
      location.set(name, new Set());
    }
    location.get(name)!.add(i);
    content.push(new Set(accounts[i].slice(1)));
  }

  for (const [name, indices] of new Map(location)) {
    for (const i of new Set(indices)) {
      for (const j of new Set(indices)) {
        if (i !== j && !isDisjoint(content[i], content[j])) {
          for (const email of content[i]) {
            content[j].add(email);
          }
          indices.delete(i);
          break;
        }
      }
    }
  }

  const result: string[][] = [];
  for (const [name, indices] of location) {
    for (const idx of indices) {
      result.push([name, ...Array.from(content[idx]).sort()]);
    }
  }
  return result;
}

function isDisjoint(a: Set<string>, b: Set<string>): boolean {
  for (const item of a) {
    if (b.has(item)) return false;
  }
  return true;
}
