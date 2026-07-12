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
  bool leafSimilar(TreeNode? root1, TreeNode? root2) {
    List<int> helper(TreeNode? root) {
      List<int> leaves = [];
      List<TreeNode> stack = [root!];
      while (stack.isNotEmpty) {
        TreeNode curr = stack.removeLast();
        if (curr.left == null && curr.right == null) {
          leaves.add(curr.val);
        }
        if (curr.left != null) {
          stack.add(curr.left!);
        }
        if (curr.right != null) {
          stack.add(curr.right!);
        }
      }
      return leaves;
    }
    List<int> leaves1 = helper(root1);
    List<int> leaves2 = helper(root2);
    if (leaves1.length != leaves2.length) return false;
    for (int i = 0; i < leaves1.length; i++) {
      if (leaves1[i] != leaves2[i]) return false;
    }
    return true;
  }
}
