function pyramidTransition(bottom: string, allowed: string[]): boolean {
  const tab: Map<string, Set<string>> = new Map();
  for (const a of allowed) {
    const key = a[0] + a[1];
    if (!tab.has(key)) tab.set(key, new Set());
    tab.get(key)!.add(a[2]);
  }

  const visited: Set<string> = new Set();

  function addNeighbor(node: string): string[] {
    let res: string[] = [""];
    for (let i = 1; i < node.length; i++) {
      const key = node[i - 1] + node[i];
      const chars = tab.get(key);
      if (!chars || chars.size === 0) return [];
      const newRes: string[] = [];
      for (const r of res) {
        for (const c of chars) {
          newRes.push(r + c);
        }
      }
      res = newRes;
    }
    return res;
  }

  function dfs(node: string): boolean {
    if (node.length === 1) return true;
    if (visited.has(node)) return false;

    for (const nxt of addNeighbor(node)) {
      if (dfs(nxt)) return true;
    }

    visited.add(node);
    return false;
  }

  return dfs(bottom);
}
