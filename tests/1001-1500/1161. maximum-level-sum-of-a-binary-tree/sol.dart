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
  int maxLevelSum(TreeNode? root) {
    int idx = 0;
    int maxSum = -1 << 63;
    var q = <TreeNode>[root!];
    int level = 1;
    while (q.isNotEmpty) {
      int qz = q.length;
      int curSum = 0;
      for (int i = 0; i < qz; i++) {
        var node = q.removeAt(0);
        curSum += node.val;
        if (node.left != null) q.add(node.left!);
        if (node.right != null) q.add(node.right!);
      }
      if (curSum > maxSum) {
        idx = level;
        maxSum = curSum;
      }
      level++;
    }
    return idx;
  }
}
