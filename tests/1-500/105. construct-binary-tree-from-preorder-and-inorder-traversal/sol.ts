function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
  const index = new Map<number, number>();
  inorder.forEach((value, i) => index.set(value, i));
  let preorderIndex = 0;

  const build = (left: number, right: number): TreeNode | null => {
    if (left > right) return null;
    const rootVal = preorder[preorderIndex++];
    const root = new TreeNode(rootVal);
    const mid = index.get(rootVal)!;
    root.left = build(left, mid - 1);
    root.right = build(mid + 1, right);
    return root;
  };

  return build(0, inorder.length - 1);
}
