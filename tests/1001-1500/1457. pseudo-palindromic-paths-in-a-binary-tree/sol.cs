/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public int val;
 *     public TreeNode left;
 *     public TreeNode right;
 *     public TreeNode(int val=0, TreeNode left=null, TreeNode right=null) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
public class Solution {
    private int count = 0;
    private int[] counter = new int[10];

    public int PseudoPalindromicPaths (TreeNode root) {
        DFS(root);
        return count;
    }

    private void DFS(TreeNode node) {
        if (node == null) return;

        counter[node.val]++;

        if (node.left == null && node.right == null) {
            if (CheckPalindromic()) count++;
        } else {
            DFS(node.left);
            DFS(node.right);
        }

        counter[node.val]--;
    }

    private bool CheckPalindromic() {
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
