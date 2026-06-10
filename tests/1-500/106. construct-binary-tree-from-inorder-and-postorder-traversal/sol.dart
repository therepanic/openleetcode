
class Solution {
  TreeNode? buildTree(List<int> inorder, List<int> postorder) {
    final index = <int, int>{};
    for (var i = 0; i < inorder.length; i++) {
      index[inorder[i]] = i;
    }
    var postIndex = postorder.length - 1;

    TreeNode? build(int left, int right) {
      if (left > right) return null;
      final rootVal = postorder[postIndex--];
      final root = TreeNode(rootVal);
      final mid = index[rootVal]!;
      root.right = build(mid + 1, right);
      root.left = build(left, mid - 1);
      return root;
    }

    return build(0, inorder.length - 1);
  }
}
