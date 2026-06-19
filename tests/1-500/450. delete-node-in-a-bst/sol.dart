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
  TreeNode? deleteNode(TreeNode? root, int key) {
    if (root == null) {
      return null;
    }
    if (root.val == key) {
      return helper(root);
    }
    
    TreeNode? dummy = root;
    while (root != null) {
      if (root.val > key) {
        if (root.left != null && root.left!.val == key) {
          root.left = helper(root.left);
          break;
        } else {
          root = root.left;
        }
      } else {
        if (root.right != null && root.right!.val == key) {
          root.right = helper(root.right);
          break;
        } else {
          root = root.right;
        }
      }
    }
    return dummy;
  }
  
  TreeNode? helper(TreeNode? root) {
    if (root == null) return null;
    if (root.left == null) {
      return root.right;
    }
    if (root.right == null) {
      return root.left;
    }
    
    TreeNode? rightChild = root.right;
    TreeNode? lastRight = flr(root.left);
    lastRight?.right = rightChild;
    return root.left;
  }
  
  TreeNode? flr(TreeNode? root) {
    if (root?.right == null) {
      return root;
    }
    return flr(root?.right);
  }
}
