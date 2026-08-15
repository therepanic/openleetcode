function maxGeneticDifference(
  parents: number[],
  queries: number[][],
): number[] {
  class TrieNode {
    count: number = 0;
    child: Map<number, TrieNode> = new Map();
  }

  class BitTrie {
    root: TrieNode = new TrieNode();

    increase(number: number, d: number): void {
      let cur = this.root;
      for (let i = 17; i >= 0; i--) {
        const bit = (number >> i) & 1;
        if (!cur.child.has(bit)) cur.child.set(bit, new TrieNode());
        cur = cur.child.get(bit)!;
        cur.count += d;
      }
    }

    findMax(number: number): number {
      let cur = this.root;
      let ans = 0;
      for (let i = 17; i >= 0; i--) {
        const bit = (number >> i) & 1;
        const desired = 1 - bit;
        if (cur.child.has(desired) && cur.child.get(desired)!.count > 0) {
          cur = cur.child.get(desired)!;
          ans |= 1 << i;
        } else {
          cur = cur.child.get(bit)!;
        }
      }
      return ans;
    }
  }

  const n = parents.length;
  const adj: number[][] = Array.from({ length: n }, () => []);
  let root = 0;
  parents.forEach((p, i) => {
    if (p === -1) root = i;
    else adj[p].push(i);
  });

  const trie = new BitTrie();
  const qmap = new Map<number, [number, number][]>();
  queries.forEach((q, i) => {
    if (!qmap.has(q[0])) qmap.set(q[0], []);
    qmap.get(q[0])!.push([i, q[1]]);
  });

  const ans: number[] = new Array(queries.length).fill(0);

  const dfs = (u: number) => {
    trie.increase(u, 1);
    if (qmap.has(u)) {
      for (const [idx, val] of qmap.get(u)!) {
        ans[idx] = trie.findMax(val);
      }
    }
    for (const v of adj[u]) dfs(v);
    trie.increase(u, -1);
  };

  dfs(root);
  return ans;
}
