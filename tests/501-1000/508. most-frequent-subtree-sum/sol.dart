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
  List<int> findFrequentTreeSum(TreeNode? root) {
    Map<int, int> c = {};
    int maxCnt = 0;
    int s(TreeNode? n) {
      if (n == null) return 0;
      int r = n.val + s(n.left) + s(n.right);
      c[r] = (c[r] ?? 0) + 1;
      if (c[r]! > maxCnt) maxCnt = c[r]!;
      return r;
    }
    s(root);
    List<int> res = [];
    c.forEach((k, v) {
      if (v == maxCnt) res.add(k);
    });
    return res;
  }
}
