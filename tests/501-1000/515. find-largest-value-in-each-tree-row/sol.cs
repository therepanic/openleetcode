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
    public IList<int> LargestValues(TreeNode root) {
        var res = new List<int>();
        void Dfs(TreeNode node, int level) {
            if (node == null) return;
            if (level == res.Count) {
                res.Add(node.val);
            } else {
                res[level] = Math.Max(res[level], node.val);
            }
            Dfs(node.left, level + 1);
            Dfs(node.right, level + 1);
        }
        Dfs(root, 0);
        return res;
    }
}
