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
  TreeNode? pruneTree(TreeNode? root) {
    bool traverseAndRemove(TreeNode? temp) {
      if (temp == null) {
        return false;
      }
      if (temp.left == null && temp.right == null) {
        return temp.val == 1;
      }
      bool left = traverseAndRemove(temp.left);
      bool right = traverseAndRemove(temp.right);
      if (!left) {
        temp.left = null;
      }
      if (!right) {
        temp.right = null;
      }
      return left || right || temp.val == 1;
    }
    
    traverseAndRemove(root);
    if (root != null && root.left == null && root.right == null && root.val == 0) {
      return null;
    }
    return root;
  }
}
