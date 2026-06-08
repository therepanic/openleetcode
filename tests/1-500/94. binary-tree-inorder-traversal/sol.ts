function inorderTraversal(root: TreeNode | null): number[] {
  const result: number[] = [];

  const traverse = (node: TreeNode | null): void => {
    if (node === null) {
      return;
    }
    traverse(node.left);
    result.push(node.val);
    traverse(node.right);
  };

  traverse(root);
  return result;
}
