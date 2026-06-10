class Solution {
  int sumNumbers(TreeNode? root) {
    int dfs(TreeNode? node, int current) {
      if (node == null) return 0;
      final next = current * 10 + node.val;
      if (node.left == null && node.right == null) return next;
      return dfs(node.left, next) + dfs(node.right, next);
    }
    return dfs(root, 0);
  }
}
