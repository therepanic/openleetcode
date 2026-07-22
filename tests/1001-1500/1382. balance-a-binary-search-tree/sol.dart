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
  TreeNode? balanceBST(TreeNode? root) {
    List<int> vals = [];
    inorder(root, vals);
    return build(vals, 0, vals.length - 1);
  }
  
  void inorder(TreeNode? node, List<int> vals) {
    if (node == null) return;
    inorder(node.left, vals);
    vals.add(node.val);
    inorder(node.right, vals);
  }
  
  TreeNode? build(List<int> vals, int l, int r) {
    if (l > r) return null;
    int mid = (l + r) ~/ 2;
    TreeNode node = TreeNode(vals[mid]);
    node.left = build(vals, l, mid - 1);
    node.right = build(vals, mid + 1, r);
    return node;
  }
}
