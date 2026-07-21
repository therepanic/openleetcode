/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    private int[] counter = new int[10];
    private int count = 0;

    public int pseudoPalindromicPaths (TreeNode root) {
        dfs(root);
        return count;
    }

    private void dfs(TreeNode node) {
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

    private boolean checkPalindromic() {
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
