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
  int? prev;
  int minDiff = double.maxFinite.toInt();
  
  int minDiffInBST(TreeNode? root) {
    inorder(root);
    return minDiff;
  }
  
  void inorder(TreeNode? root) {
    if (root == null) return;
    inorder(root.left);
    if (prev != null) {
      int diff = root.val - prev!;
      if (diff < minDiff) {
        minDiff = diff;
      }
    }
    prev = root.val;
    inorder(root.right);
  }
}
