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
  List<int> findMode(TreeNode? root) {
    List<int> lst = [];
    void traverse(TreeNode? curr) {
      if (curr != null) {
        lst.add(curr.val);
        traverse(curr.left);
        traverse(curr.right);
      }
    }
    traverse(root);
    Map<int, int> d = {};
    for (var v in lst) {
      d[v] = (d[v] ?? 0) + 1;
    }
    int m = 0;
    for (var v in lst) {
      m = m > d[v]! ? m : d[v]!;
    }
    Set<int> sol = {};
    for (var v in lst) {
      if (d[v] == m) {
        sol.add(v);
      }
    }
    return sol.toList();
  }
}
