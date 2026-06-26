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
  TreeNode? addOneRow(TreeNode? root, int val, int depth) {
    if (depth == 1) {
      TreeNode newRoot = TreeNode(val);
      newRoot.left = root;
      return newRoot;
    }
    
    void construct(TreeNode? temp, int count) {
      if (temp == null) {
        return;
      }
      if (count == depth - 1) {
        TreeNode newLeft = TreeNode(val);
        newLeft.left = temp.left;
        temp.left = newLeft;
        
        TreeNode newRight = TreeNode(val);
        newRight.right = temp.right;
        temp.right = newRight;
        return;
      }
      construct(temp.left, count + 1);
      construct(temp.right, count + 1);
    }
    
    construct(root, 1);
    return root;
  }
}
