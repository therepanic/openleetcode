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
  TreeNode? subtreeWithAllDeepest(TreeNode? root) {
    if (root == null) return null;
    
    Map<TreeNode, TreeNode?> parent = {root: null};
    var q = <TreeNode>[root];
    List<TreeNode> lastLevel = [];
    
    while (q.isNotEmpty) {
      int size = q.length;
      lastLevel = [];
      for (int i = 0; i < size; i++) {
        TreeNode node = q.removeAt(0);
        lastLevel.add(node);
        if (node.left != null) {
          parent[node.left!] = node;
          q.add(node.left!);
        }
        if (node.right != null) {
          parent[node.right!] = node;
          q.add(node.right!);
        }
      }
    }
    
    var deepest = lastLevel.toSet();
    while (deepest.length > 1) {
      deepest = deepest.map((node) => parent[node]!).toSet();
    }
    
    return deepest.first;
  }
}
