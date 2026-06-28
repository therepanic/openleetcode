function levelOrderBottom(root: TreeNode | null): number[][] {
  if (root === null) return [];
  const levels: number[][] = [];
  const queue: TreeNode[] = [root];
  for (let head = 0; head < queue.length;) {
    const size = queue.length - head;
    const level: number[] = [];
    for (let i = 0; i < size; i++) {
      const node = queue[head++];
      level.push(node.val);
      if (node.left !== null) queue.push(node.left);
      if (node.right !== null) queue.push(node.right);
    }
    levels.push(level);
  }
  levels.reverse();
  return levels;
}
