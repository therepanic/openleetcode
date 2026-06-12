function isBalanced(root: TreeNode | null): boolean {
  const height = (node: TreeNode | null): number => {
    if (node === null) return 0;
    const left = height(node.left);
    if (left === -1) return -1;
    const right = height(node.right);
    if (right === -1) return -1;
    if (Math.abs(left - right) > 1) return -1;
    return 1 + Math.max(left, right);
  };
  return height(root) !== -1;
}
