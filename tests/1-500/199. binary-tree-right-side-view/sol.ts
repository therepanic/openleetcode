function rightSideView(root: TreeNode | null): number[] {
  if (root === null) {
    return [];
  }

  const result: number[] = [];
  const queue: TreeNode[] = [root];
  let index = 0;
  while (index < queue.length) {
    const levelEnd = queue.length;
    let rightmost = 0;
    while (index < levelEnd) {
      const node = queue[index++];
      rightmost = node.val;
      if (node.left !== null) {
        queue.push(node.left);
      }
      if (node.right !== null) {
        queue.push(node.right);
      }
    }
    result.push(rightmost);
  }
  return result;
}
