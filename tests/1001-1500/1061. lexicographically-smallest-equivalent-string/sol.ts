function smallestEquivalentString(
  s1: string,
  s2: string,
  baseStr: string,
): string {
  const adj: Map<string, string[]> = new Map();
  for (let i = 0; i < s1.length; i++) {
    const a = s1[i];
    const b = s2[i];
    if (!adj.has(a)) adj.set(a, []);
    if (!adj.has(b)) adj.set(b, []);
    adj.get(a)!.push(b);
    adj.get(b)!.push(a);
  }

  function dfs(ch: string, visited: Set<string>): string {
    visited.add(ch);
    let minCh = ch;
    for (const nei of adj.get(ch) || []) {
      if (!visited.has(nei)) {
        const candidate = dfs(nei, visited);
        if (candidate < minCh) minCh = candidate;
      }
    }
    return minCh;
  }

  let result = "";
  for (const ch of baseStr) {
    const visited = new Set<string>();
    result += dfs(ch, visited);
  }
  return result;
}
