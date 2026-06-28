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
  int findBottomLeftValue(TreeNode? root) {
    var queue = <TreeNode>[root!];
    int leftmost = root.val;

    while (queue.isNotEmpty) {
      int levelSize = queue.length;
      leftmost = queue[0].val;

      for (int i = 0; i < levelSize; i++) {
        var node = queue.removeAt(0);
        if (node.left != null) {
          queue.add(node.left!);
        }
        if (node.right != null) {
          queue.add(node.right!);
        }
      }
    }

    return leftmost;
  }
}
