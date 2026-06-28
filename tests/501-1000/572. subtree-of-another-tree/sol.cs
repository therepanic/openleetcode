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
    public bool IsSubtree(TreeNode root, TreeNode subRoot) {
        string r = Ser(root);
        string s = Ser(subRoot);
        return r.Contains(s);
    }
    
    private string Ser(TreeNode n) {
        if (n == null) return ",#";
        return "," + n.val + Ser(n.left) + Ser(n.right);
    }
}
