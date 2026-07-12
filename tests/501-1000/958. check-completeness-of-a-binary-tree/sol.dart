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
  bool isCompleteTree(TreeNode? root) {
    var q = <TreeNode?>[root];
    bool past = false;
    while (q.isNotEmpty) {
      var node = q.removeAt(0);
      if (node == null) {
        past = true;
      } else {
        if (past) return false;
        q.add(node.left);
        q.add(node.right);
      }
    }
    return true;
  }
}
