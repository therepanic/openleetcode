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
    public int MaxAncestorDiff(TreeNode root) {
        int[] m = new int[] { 0 };
        Dfs(root, m);
        return m[0];
    }
    
    private (int, int) Dfs(TreeNode root, int[] m) {
        if (root == null) {
            return (int.MaxValue, int.MinValue);
        }
        var left = Dfs(root.left, m);
        var right = Dfs(root.right, m);
        int minVal = Math.Min(root.val, Math.Min(left.Item1, right.Item1));
        int maxVal = Math.Max(root.val, Math.Max(left.Item2, right.Item2));
        m[0] = Math.Max(m[0], Math.Max(Math.Abs(minVal - root.val), Math.Abs(maxVal - root.val)));
        return (minVal, maxVal);
    }
}
