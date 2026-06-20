class Solution {
  int maxPathSum(TreeNode? root) {
    var best = root!.val;

    int dfs(TreeNode? node) {
      if (node == null) {
        return 0;
      }
      final left = dfs(node.left);
      final right = dfs(node.right);
      final leftGain = left > 0 ? left : 0;
      final rightGain = right > 0 ? right : 0;
      final total = node.val + leftGain + rightGain;
      if (total > best) {
        best = total;
      }
      return node.val + (leftGain > rightGain ? leftGain : rightGain);
    }

    dfs(root);
    return best;
  }
}
