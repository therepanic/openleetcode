function generateTrees(n: number): Array<TreeNode | null> {
  if (n === 0) {
    return [];
  }
  return buildTrees(1, n);
}

function buildTrees(start: number, end: number): Array<TreeNode | null> {
  if (start > end) {
    return [null];
  }

  const result: Array<TreeNode | null> = [];
  for (let rootValue = start; rootValue <= end; rootValue++) {
    const leftTrees = buildTrees(start, rootValue - 1);
    const rightTrees = buildTrees(rootValue + 1, end);
    for (const left of leftTrees) {
      for (const right of rightTrees) {
        const root = new TreeNode(rootValue);
        root.left = left;
        root.right = right;
        result.push(root);
      }
    }
  }

  return result;
}
