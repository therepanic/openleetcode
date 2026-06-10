
class Solution {
  TreeNode? buildTree(List<int> preorder, List<int> inorder) {
    final index = <int, int>{};
    for (var i = 0; i < inorder.length; i++) {
      index[inorder[i]] = i;
    }
    var preorderIndex = 0;

    TreeNode? build(int left, int right) {
      if (left > right) return null;
      final rootVal = preorder[preorderIndex++];
      final root = TreeNode(rootVal);
      final mid = index[rootVal]!;
      root.left = build(left, mid - 1);
      root.right = build(mid + 1, right);
      return root;
    }

    return build(0, inorder.length - 1);
  }
}
