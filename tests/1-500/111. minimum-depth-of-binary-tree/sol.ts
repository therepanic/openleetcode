function minDepth(root: TreeNode | null): number {
  if (root === null) return 0;
  const queue: Array<[TreeNode, number]> = [[root, 1]];
  for (let head = 0; head < queue.length; head++) {
    const [node, depth] = queue[head];
    if (node.left === null && node.right === null) return depth;
    if (node.left !== null) queue.push([node.left, depth + 1]);
    if (node.right !== null) queue.push([node.right, depth + 1]);
  }
  return 0;
}
