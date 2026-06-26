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
    private int total = 0;
    
    public TreeNode ConvertBST(TreeNode root) {
        Traverse(root);
        return root;
    }
    
    private void Traverse(TreeNode node) {
        if (node == null) {
            return;
        }
        Traverse(node.right);
        total += node.val;
        node.val = total;
        Traverse(node.left);
    }
}
