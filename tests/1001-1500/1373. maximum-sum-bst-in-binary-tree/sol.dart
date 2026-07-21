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
  int best = 0;
  
  int maxSumBST(TreeNode? root) {
    best = 0;
    dfs(root);
    return best;
  }
  
  List<int> dfs(TreeNode? node) {
    if (node == null) {
      return [1, 0x7FFFFFFF, -0x80000000, 0];
    }
    
    List<int> left = dfs(node.left);
    List<int> right = dfs(node.right);
    
    int lbst = left[0], lmin = left[1], lmax = left[2], lsum = left[3];
    int rbst = right[0], rmin = right[1], rmax = right[2], rsum = right[3];
    
    if (lbst == 1 && rbst == 1 && lmax < node.val && node.val < rmin) {
      int total = lsum + rsum + node.val;
      best = best > total ? best : total;
      int newMin = lmin < node.val ? lmin : node.val;
      int newMax = rmax > node.val ? rmax : node.val;
      return [1, newMin, newMax, total];
    }
    
    return [0, -0x80000000, 0x7FFFFFFF, 0];
  }
}
