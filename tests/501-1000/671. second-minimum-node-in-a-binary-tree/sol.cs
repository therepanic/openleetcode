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
    public int FindSecondMinimumValue(TreeNode root) {
        int first = root.val;
        long second = long.MaxValue;
        
        void Dfs(TreeNode node) {
            if (node == null) return;
            if (first < node.val && node.val < second) {
                second = node.val;
            }
            Dfs(node.left);
            Dfs(node.right);
        }
        
        Dfs(root);
        return second == long.MaxValue ? -1 : (int)second;
    }
}
