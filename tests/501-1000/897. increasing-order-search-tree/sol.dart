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
  TreeNode? increasingBST(TreeNode? root) {
    List<int> vals = [];
    inord(root, vals);
    return create(vals, 0);
  }
  
  TreeNode? create(List<int> vals, int i) {
    if (i >= vals.length) return null;
    TreeNode node = TreeNode(vals[i]);
    node.right = create(vals, i + 1);
    return node;
  }
  
  void inord(TreeNode? root, List<int> vals) {
    if (root == null) return;
    inord(root.left, vals);
    vals.add(root.val);
    inord(root.right, vals);
  }
}
