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
    private List<int> flippedNodes;
    private int idx;
    private int[] voyage;
    
    public IList<int> FlipMatchVoyage(TreeNode root, int[] voyage) {
        flippedNodes = new List<int>();
        idx = 0;
        this.voyage = voyage;
        
        if (!Dfs(root)) return new List<int> { -1 };
        return flippedNodes;
    }
    
    private bool Dfs(TreeNode node) {
        if (node == null) return true;
        if (node.val != voyage[idx]) return false;
        
        idx++;
        if (node.left != null && node.right != null) {
            if (voyage[idx] == node.right.val) {
                flippedNodes.Add(node.val);
                if (!Dfs(node.right)) return false;
                if (!Dfs(node.left)) return false;
            } else if (voyage[idx] == node.left.val) {
                if (!Dfs(node.left)) return false;
                if (!Dfs(node.right)) return false;
            } else {
                return false;
            }
        } else {
            if (node.left != null) {
                if (!Dfs(node.left)) return false;
            } else if (node.right != null) {
                if (!Dfs(node.right)) return false;
            }
        }
        return true;
    }
}
