function minNumberOfSemesters(
  n: number,
  relations: number[][],
  k: number,
): number {
  const graph: number[][] = Array.from({ length: n }, () => []);
  const inDegrees: number[] = Array(n).fill(0);
  for (const [prev, next] of relations) {
    inDegrees[next - 1]++;
    graph[prev - 1].push(next - 1);
  }

  const memo = new Map<string, number>();

  const recurse = (mask: number, inDeg: number[]): number => {
    if (mask === 0) return 0;
    const key = `${mask}-${inDeg.toString()}`;
    if (memo.has(key)) return memo.get(key)!;

    const nodes: number[] = [];
    for (let i = 0; i < n; i++) {
      if ((mask & (1 << i)) !== 0 && inDeg[i] === 0) {
        nodes.push(i);
      }
    }
    let ans = Infinity;
    const combLimit = Math.min(k, nodes.length);
    const combos = getCombinations(nodes, combLimit);
    for (const kNodes of combos) {
      let newMask = mask;
      const newInDeg = [...inDeg];
      for (const node of kNodes) {
        newMask ^= 1 << node;
        for (const child of graph[node]) {
          newInDeg[child]--;
        }
      }
      ans = Math.min(ans, 1 + recurse(newMask, newInDeg));
    }
    memo.set(key, ans);
    return ans;
  };

  return recurse((1 << n) - 1, inDegrees);
}

function getCombinations(arr: number[], k: number): number[][] {
  const result: number[][] = [];
  const helper = (start: number, current: number[]) => {
    if (current.length === k) {
      result.push([...current]);
      return;
    }
    for (let i = start; i < arr.length; i++) {
      current.push(arr[i]);
      helper(i + 1, current);
      current.pop();
    }
  };
  helper(0, []);
  return result;
}
