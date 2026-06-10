function maxPathSum(root: TreeNode | null): number {
  let best = root!.val;

  const dfs = (node: TreeNode | null): number => {
    if (node === null) {
      return 0;
    }
    const left = Math.max(dfs(node.left), 0);
    const right = Math.max(dfs(node.right), 0);
    best = Math.max(best, node.val + left + right);
    return node.val + Math.max(left, right);
  };

  dfs(root);
  return best;
}
