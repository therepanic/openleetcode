function buildTree(inorder: number[], postorder: number[]): TreeNode | null {
  const index = new Map<number, number>();
  inorder.forEach((value, i) => index.set(value, i));
  let postIndex = postorder.length - 1;

  const build = (left: number, right: number): TreeNode | null => {
    if (left > right) return null;
    const rootVal = postorder[postIndex--];
    const root = new TreeNode(rootVal);
    const mid = index.get(rootVal)!;
    root.right = build(mid + 1, right);
    root.left = build(left, mid - 1);
    return root;
  };

  return build(0, inorder.length - 1);
}
