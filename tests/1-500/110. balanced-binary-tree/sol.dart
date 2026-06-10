
class Solution {
  bool isBalanced(TreeNode? root) {
    int height(TreeNode? node) {
      if (node == null) return 0;
      final left = height(node.left);
      if (left == -1) return -1;
      final right = height(node.right);
      if (right == -1) return -1;
      if ((left - right).abs() > 1) return -1;
      return 1 + (left > right ? left : right);
    }

    return height(root) != -1;
  }
}
