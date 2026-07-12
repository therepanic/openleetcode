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
    public IList<IList<int>> VerticalTraversal(TreeNode root) {
        List<(int col, int row, int val)> nodes = new List<(int, int, int)>();
        
        void Dfs(TreeNode node, int row, int col) {
            if (node == null) return;
            nodes.Add((col, row, node.val));
            Dfs(node.left, row + 1, col - 1);
            Dfs(node.right, row + 1, col + 1);
        }
        
        Dfs(root, 0, 0);
        
        nodes.Sort((a, b) => {
            if (a.col != b.col) return a.col.CompareTo(b.col);
            if (a.row != b.row) return a.row.CompareTo(b.row);
            return a.val.CompareTo(b.val);
        });
        
        IList<IList<int>> res = new List<IList<int>>();
        int? prevCol = null;
        
        foreach (var (col, _, val) in nodes) {
            if (col != prevCol) {
                res.Add(new List<int>());
                prevCol = col;
            }
            res[res.Count - 1].Add(val);
        }
        
        return res;
    }
}
