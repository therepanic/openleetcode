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
  int longestZigZag(TreeNode? root) {
    if (root == null) return 0;
    int best = 0;
    final List<List<dynamic>> stack = [[root, 0, 0]];
    while (stack.isNotEmpty) {
      final state = stack.removeLast();
      final TreeNode node = state[0] as TreeNode;
      final int endedLeft = state[1] as int;
      final int endedRight = state[2] as int;
      if (endedLeft > best) best = endedLeft;
      if (endedRight > best) best = endedRight;
      if (node.left != null) {
        stack.add([node.left!, endedRight + 1, 0]);
      }
      if (node.right != null) {
        stack.add([node.right!, 0, endedLeft + 1]);
      }
    }
    return best;
  }
}
