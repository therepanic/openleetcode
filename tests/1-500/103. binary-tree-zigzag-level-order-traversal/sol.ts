function zigzagLevelOrder(root: TreeNode | null): number[][] {
  if (root === null) return [];
  const result: number[][] = [];
  const queue: TreeNode[] = [root];
  let leftToRight = true;
  for (let head = 0; head < queue.length;) {
    const size = queue.length - head;
    const level = new Array<number>(size);
    for (let i = 0; i < size; i++) {
      const node = queue[head++];
      const idx = leftToRight ? i : size - 1 - i;
      level[idx] = node.val;
      if (node.left !== null) queue.push(node.left);
      if (node.right !== null) queue.push(node.right);
    }
    result.push(level);
    leftToRight = !leftToRight;
  }
  return result;
}
