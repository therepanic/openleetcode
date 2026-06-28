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
  final Map<String, int> seen = {};
  final List<TreeNode?> ans = [];
  
  List<TreeNode?> findDuplicateSubtrees(TreeNode? root) {
    solve(root);
    return ans;
  }
  
  String solve(TreeNode? node) {
    if (node == null) {
      return "#";
    }
    String left = solve(node.left);
    String right = solve(node.right);
    String currTree = "${node.val}, $left, $right";
    seen[currTree] = (seen[currTree] ?? 0) + 1;
    if (seen[currTree] == 2) {
      ans.add(node);
    }
    return currTree;
  }
}
