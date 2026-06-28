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
  TreeNode? constructMaximumBinaryTree(List<int> nums) {
    List<TreeNode> stack = [];
    
    for (int num in nums) {
      TreeNode current = TreeNode(num);
      
      while (stack.isNotEmpty && stack.last.val < num) {
        current.left = stack.removeLast();
      }
      
      if (stack.isNotEmpty) {
        stack.last.right = current;
      }
      
      stack.add(current);
    }
    
    return stack[0];
  }
}
