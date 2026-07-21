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
  List<int> getAllElements(TreeNode? root1, TreeNode? root2) {
    List<TreeNode> stack1 = [];
    List<TreeNode> stack2 = [];
    List<int> output = [];
    
    while (root1 != null || root2 != null || stack1.isNotEmpty || stack2.isNotEmpty) {
      while (root1 != null) {
        stack1.add(root1);
        root1 = root1.left;
      }
      while (root2 != null) {
        stack2.add(root2);
        root2 = root2.left;
      }

      if (stack1.isNotEmpty && stack2.isNotEmpty) {
        if (stack1.last.val <= stack2.last.val) {
          root1 = stack1.removeLast();
          output.add(root1.val);
          root1 = root1.right;
        } else {
          root2 = stack2.removeLast();
          output.add(root2.val);
          root2 = root2.right;
        }
      } else if (stack1.isEmpty) {
        root2 = stack2.removeLast();
        output.add(root2.val);
        root2 = root2.right;
      } else {
        root1 = stack1.removeLast();
        output.add(root1.val);
        root1 = root1.right;
      }
    }
    
    return output;
  }
}
