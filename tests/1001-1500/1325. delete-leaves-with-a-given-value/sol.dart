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
  TreeNode? removeLeafNodes(TreeNode? root, int target) {
    bool traverseAndRemove(TreeNode? temp) {
      if (temp == null) {
        return false;
      }
      if (temp.left == null && temp.right == null) {
        return temp.val != target;
      }
      bool left = traverseAndRemove(temp.left);
      bool right = traverseAndRemove(temp.right);
      if (!left) {
        temp.left = null;
      }
      if (!right) {
        temp.right = null;
      }
      return left || right || temp.val != target;
    }
    
    if (!traverseAndRemove(root)) {
      return null;
    }
    return root;
  }
}
