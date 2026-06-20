
class Solution {
  bool isSymmetric(TreeNode? root) {
    bool mirror(TreeNode? left, TreeNode? right) {
      if (left == null || right == null) return left == right;
      return left.val == right.val &&
          mirror(left.left, right.right) &&
          mirror(left.right, right.left);
    }
    return root == null || mirror(root.left, root.right);
  }
}
