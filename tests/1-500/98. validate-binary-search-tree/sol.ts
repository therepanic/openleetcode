function isValidBST(root: TreeNode | null): boolean {
  const validate = (
    node: TreeNode | null,
    lower: number | null,
    upper: number | null,
  ): boolean => {
    if (node === null) {
      return true;
    }
    if (
      (lower !== null && node.val <= lower) ||
      (upper !== null && node.val >= upper)
    ) {
      return false;
    }
    return (
      validate(node.left, lower, node.val) &&
      validate(node.right, node.val, upper)
    );
  };

  return validate(root, null, null);
}
