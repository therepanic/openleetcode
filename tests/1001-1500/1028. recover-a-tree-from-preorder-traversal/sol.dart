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
  TreeNode? recoverFromPreorder(String traversal) {
    final stack = <TreeNode>[];
    TreeNode? root;
    var i = 0;
    while (i < traversal.length) {
      var depth = 0;
      while (i < traversal.length && traversal[i] == '-') {
        depth++;
        i++;
      }
      var num = 0;
      while (i < traversal.length) {
        final code = traversal.codeUnitAt(i);
        if (code < 48 || code > 57) {
          break;
        }
        num = num * 10 + (code - 48);
        i++;
      }
      final node = TreeNode(num);
      while (stack.length > depth) {
        stack.removeLast();
      }
      if (stack.isEmpty) {
        root = node;
      } else {
        final parent = stack.last;
        if (parent.left == null) {
          parent.left = node;
        } else {
          parent.right = node;
        }
      }
      stack.add(node);
    }
    return root;
  }
}
