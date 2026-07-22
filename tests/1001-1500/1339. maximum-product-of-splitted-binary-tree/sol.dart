/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Solution {
  int maxProduct(TreeNode? root) {
    const mod = 1000000007;
    final nodes = <TreeNode>[];
    final stack = <TreeNode?>[root];

    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      if (node != null) {
        nodes.add(node);
        stack.add(node.left);
        stack.add(node.right);
      }
    }

    final sums = <TreeNode, int>{};
    for (final node in nodes.reversed) {
      sums[node] = node.val + (sums[node.left] ?? 0) + (sums[node.right] ?? 0);
    }

    final total = sums[root]!;
    int best = 0;
    for (final sub in sums.values) {
      best = best > sub * (total - sub) ? best : sub * (total - sub);
    }
    return best % mod;
  }
}
