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
  int count = 0;
  List<int> counter = List.filled(10, 0);

  int pseudoPalindromicPaths (TreeNode? root) {
    dfs(root);
    return count;
  }

  void dfs(TreeNode? node) {
    if (node == null) return;

    counter[node.val]++;

    if (node.left == null && node.right == null) {
      if (checkPalindromic()) count++;
    } else {
      dfs(node.left);
      dfs(node.right);
    }

    counter[node.val]--;
  }

  bool checkPalindromic() {
    int odd = 0;
    for (int i = 1; i <= 9; i++) {
      if (counter[i] % 2 == 1) {
        odd++;
        if (odd > 1) return false;
      }
    }
    return true;
  }
}
