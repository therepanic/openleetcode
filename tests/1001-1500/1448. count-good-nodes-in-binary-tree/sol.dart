class Solution {
  int goodNodes(TreeNode? root) {
    int dfs(TreeNode? node, int maxSoFar) {
      if (node == null) return 0;

      final int nextMax = node.val > maxSoFar ? node.val : maxSoFar;
      final int good = node.val >= maxSoFar ? 1 : 0;
      return good + dfs(node.left, nextMax) + dfs(node.right, nextMax);
    }

    return dfs(root, root!.val);
  }
}
