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
    public int CountNodes(TreeNode root) {
        if (root == null) {
            return 0;
        }
        
        int leftDepth = GetDepth(root.left);
        int rightDepth = GetDepth(root.right);
        
        if (leftDepth == rightDepth) {
            return (1 << leftDepth) + CountNodes(root.right);
        } else {
            return (1 << rightDepth) + CountNodes(root.left);
        }
    }
    
    private int GetDepth(TreeNode node) {
        int depth = 0;
        while (node != null) {
            depth++;
            node = node.left;
        }
        return depth;
    }
}
