
class Solution {
  int maxDepth(TreeNode? root) {
    if (root == null) return 0;
    final left = maxDepth(root.left);
    final right = maxDepth(root.right);
    return 1 + (left > right ? left : right);
  }
}
