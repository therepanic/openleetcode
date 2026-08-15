function smallestMissingValueSubtree(
  parents: number[],
  nums: number[],
): number[] {
  const n = parents.length;
  const graph: number[][] = Array.from({ length: n }, () => []);
  let nodeOne = -1;
  let root = -1;

  for (let child = 0; child < n; child++) {
    if (parents[child] === -1) {
      root = child;
    } else {
      graph[parents[child]].push(child);
    }
    if (nums[child] === 1) nodeOne = child;
  }

  const results = new Array(n).fill(1);
  if (nodeOne === -1) return results;

  const seen = new Array(100002).fill(false);
  let current = nodeOne;
  let missing = 1;

  while (current !== -1) {
    markSeen(current, graph, seen, nums);
    while (missing < 100002 && seen[missing]) missing++;
    results[current] = missing;
    current = parents[current];
  }

  return results;
}

function markSeen(
  node: number,
  graph: number[][],
  seen: boolean[],
  nums: number[],
) {
  if (!seen[nums[node]]) {
    seen[nums[node]] = true;
    for (const child of graph[node]) {
      markSeen(child, graph, seen, nums);
    }
  }
}
