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
  List<List<int>> verticalTraversal(TreeNode? root) {
    List<List<int>> nodes = [];
    
    void dfs(TreeNode? node, int row, int col) {
      if (node == null) return;
      nodes.add([col, row, node.val]);
      dfs(node.left, row + 1, col - 1);
      dfs(node.right, row + 1, col + 1);
    }
    
    dfs(root, 0, 0);
    
    nodes.sort((a, b) {
      if (a[0] != b[0]) return a[0].compareTo(b[0]);
      if (a[1] != b[1]) return a[1].compareTo(b[1]);
      return a[2].compareTo(b[2]);
    });
    
    List<List<int>> res = [];
    int prevCol = -9999999;
    
    for (var node in nodes) {
      int col = node[0], val = node[2];
      if (col != prevCol) {
        res.add([]);
        prevCol = col;
      }
      res.last.add(val);
    }
    
    return res;
  }
}
