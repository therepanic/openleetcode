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
  int sumEvenGrandparent(TreeNode? root) {
    var queue = Queue<List<dynamic>>();
    queue.add([root, -1, -1]);
    int res = 0;
    while (queue.isNotEmpty) {
      final state = queue.removeFirst();
      final TreeNode? node = state[0] as TreeNode?;
      final int parent = state[1] as int;
      final int grandparent = state[2] as int;
      if (node == null) continue;
      if (grandparent % 2 == 0) {
        res += node.val;
      }
      if (node.left != null) {
        queue.add([node.left, node.val, parent]);
      }
      if (node.right != null) {
        queue.add([node.right, node.val, parent]);
      }
    }
    return res;
  }
}
