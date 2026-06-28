function averageOfLevels(root: TreeNode | null): number[] {
  if (!root) return [];

  const res: number[] = [];
  const queue: TreeNode[] = [root];
  let head = 0;

  while (head < queue.length) {
    let levelSum = 0;
    const count = queue.length - head;

    for (let i = 0; i < count; i++) {
      const node = queue[head++];
      levelSum += node.val;
      if (node.left) queue.push(node.left);
      if (node.right) queue.push(node.right);
    }

    res.push(levelSum / count);
  }

  return res;
}
