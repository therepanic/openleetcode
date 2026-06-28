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
    private Dictionary<string, int> seen = new Dictionary<string, int>();
    private List<TreeNode> ans = new List<TreeNode>();
    
    public IList<TreeNode> FindDuplicateSubtrees(TreeNode root) {
        Solve(root);
        return ans;
    }
    
    private string Solve(TreeNode node) {
        if (node == null) {
            return "#";
        }
        string left = Solve(node.left);
        string right = Solve(node.right);
        string currTree = $"{node.val}, {left}, {right}";
        if (!seen.ContainsKey(currTree)) {
            seen[currTree] = 0;
        }
        seen[currTree]++;
        if (seen[currTree] == 2) {
            ans.Add(node);
        }
        return currTree;
    }
}
