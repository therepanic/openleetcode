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
    public int SumRootToLeaf(TreeNode root) {
        return Dfs(root, 0);
    }
    
    private int Dfs(TreeNode node, int current) {
        if (node == null) {
            return 0;
        }
        
        current = current * 2 + node.val;
        
        if (node.left == null && node.right == null) {
            return current;
        }
        
        return Dfs(node.left, current) + Dfs(node.right, current);
    }
}
