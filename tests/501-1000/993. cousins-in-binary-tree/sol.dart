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
  bool isCousins(TreeNode? root, int x, int y) {
    List<List<Object?>> res = [];
    List<List<Object?>> stack = [];
    stack.add([root, null, 0]);
    while (stack.isNotEmpty) {
      var cur = stack.removeLast();
      TreeNode? curr = cur[0] as TreeNode?;
      TreeNode? parent = cur[1] as TreeNode?;
      int depth = cur[2] as int;
      if (curr!.val == x || curr.val == y) {
        res.add([parent, depth]);
      }
      if (curr.left != null) {
        stack.add([curr.left, curr, depth + 1]);
      }
      if (curr.right != null) {
        stack.add([curr.right, curr, depth + 1]);
      }
    }
    return res.length == 2 && res[0][1] == res[1][1] && res[0][0] != res[1][0];
  }
}
