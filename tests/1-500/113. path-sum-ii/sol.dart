
class Solution {
  List<List<int>> pathSum(TreeNode? root, int targetSum) {
    final result = <List<int>>[];
    final path = <int>[];

    void dfs(TreeNode? node, int remaining) {
      if (node == null) return;
      path.add(node.val);
      remaining -= node.val;
      if (node.left == null && node.right == null && remaining == 0) {
        result.add(List<int>.from(path));
      } else {
        dfs(node.left, remaining);
        dfs(node.right, remaining);
      }
      path.removeLast();
    }

    dfs(root, targetSum);
    return result;
  }
}
