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
    public TreeNode InsertIntoMaxTree(TreeNode root, int val) {
        return Dfs(root, val);
    }
    
    private TreeNode Dfs(TreeNode node, int val) {
        if (node == null) {
            return new TreeNode(val);
        }
        if (node.val > val) {
            node.right = Dfs(node.right, val);
            return node;
        }
        TreeNode temp = new TreeNode(val);
        temp.left = node;
        return temp;
    }
}
