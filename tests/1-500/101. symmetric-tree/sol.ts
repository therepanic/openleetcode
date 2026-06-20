function isSymmetric(root: TreeNode | null): boolean {
  const mirror = (left: TreeNode | null, right: TreeNode | null): boolean => {
    if (left === null || right === null) return left === right;
    return (
      left.val === right.val &&
      mirror(left.left, right.right) &&
      mirror(left.right, right.left)
    );
  };
  return root === null || mirror(root.left, root.right);
}
