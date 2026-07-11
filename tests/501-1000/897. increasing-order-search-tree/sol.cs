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
    public TreeNode IncreasingBST(TreeNode root) {
        List<int> vals = new List<int>();
        Inord(root, vals);
        return Create(vals, 0);
    }
    
    private TreeNode Create(List<int> vals, int i) {
        if (i >= vals.Count) return null;
        TreeNode node = new TreeNode(vals[i]);
        node.right = Create(vals, i + 1);
        return node;
    }
    
    private void Inord(TreeNode root, List<int> vals) {
        if (root == null) return;
        Inord(root.left, vals);
        vals.Add(root.val);
        Inord(root.right, vals);
    }
}
