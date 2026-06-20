function pathSum(root: TreeNode | null, targetSum: number): number[][] {
  const result: number[][] = [];
  const path: number[] = [];

  const dfs = (node: TreeNode | null, remaining: number): void => {
    if (node === null) return;
    path.push(node.val);
    remaining -= node.val;
    if (node.left === null && node.right === null && remaining === 0) {
      result.push(path.slice());
    } else {
      dfs(node.left, remaining);
      dfs(node.right, remaining);
    }
    path.pop();
  };

  dfs(root, targetSum);
  return result;
}
