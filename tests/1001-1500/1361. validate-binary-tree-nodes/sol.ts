function validateBinaryTreeNodes(
  n: number,
  leftChild: number[],
  rightChild: number[],
): boolean {
  const inDegree: number[] = new Array(n).fill(0);
  for (let i = 0; i < n; i++) {
    for (const child of [leftChild[i], rightChild[i]]) {
      if (child !== -1) {
        if (child < 0 || child >= n) return false;
        inDegree[child]++;
        if (inDegree[child] > 1) return false;
      }
    }
  }

  let root = -1;
  for (let i = 0; i < n; i++) {
    if (inDegree[i] === 0) {
      if (root !== -1) return false;
      root = i;
    }
  }
  if (root === -1) return false;

  const queue: number[] = [root];
  const visited: boolean[] = new Array(n).fill(false);
  visited[root] = true;
  let count = 1;

  while (queue.length > 0) {
    const node = queue.shift()!;
    for (const child of [leftChild[node], rightChild[node]]) {
      if (child === -1) continue;
      if (visited[child]) return false;
      visited[child] = true;
      count++;
      queue.push(child);
    }
  }
  return count === n;
}
