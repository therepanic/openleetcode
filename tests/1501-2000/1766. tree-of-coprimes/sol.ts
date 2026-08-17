function getCoprimes(nums: number[], edges: number[][]): number[] {
  const n = nums.length;
  const adj: number[][] = Array.from({ length: n }, () => []);
  for (const [u, v] of edges) {
    adj[u].push(v);
    adj[v].push(u);
  }
  const ans: number[] = new Array(n).fill(-1);
  const depth: number[] = new Array(n).fill(0);
  const ancestorByValue: number[] = new Array(51).fill(-1);

  function gcd(a: number, b: number): number {
    return b === 0 ? a : gcd(b, a % b);
  }

  function dfs(node: number, prev: number, dep: number): void {
    depth[node] = dep;
    let best = Number.MAX_SAFE_INTEGER;
    let bestAnc = -1;
    for (let i = 1; i <= 50; i++) {
      if (gcd(i, nums[node]) === 1) {
        const anc = ancestorByValue[i];
        if (anc !== -1) {
          const diff = dep - depth[anc];
          if (diff < best) {
            best = diff;
            bestAnc = anc;
          }
        }
      }
    }
    ans[node] = bestAnc;
    const prevState = ancestorByValue[nums[node]];
    ancestorByValue[nums[node]] = node;
    for (const v of adj[node]) {
      if (v !== prev) dfs(v, node, dep + 1);
    }
    ancestorByValue[nums[node]] = prevState;
  }

  dfs(0, 0, 0);
  return ans;
}
