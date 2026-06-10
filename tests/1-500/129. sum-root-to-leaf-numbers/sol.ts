function sumNumbers(root: TreeNode | null): number {
  const dfs = (node: TreeNode | null, current: number): number => {
    if (node === null) return 0;
    const next = current * 10 + node.val;
    if (node.left === null && node.right === null) return next;
    return dfs(node.left, next) + dfs(node.right, next);
  };
  return dfs(root, 0);
}
