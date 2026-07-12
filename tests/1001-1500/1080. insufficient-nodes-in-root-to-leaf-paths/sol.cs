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
    public TreeNode SufficientSubset(TreeNode root, int limit) {
        bool Dfs(TreeNode node, int pathSum) {
            if (node == null) {
                return false;
            }
            
            int curr = pathSum + node.val;
            
            if (node.left == null && node.right == null) {
                return curr >= limit;
            }
            
            bool leftGood = Dfs(node.left, curr);
            bool rightGood = Dfs(node.right, curr);
            
            if (!leftGood) {
                node.left = null;
            }
            if (!rightGood) {
                node.right = null;
            }
            
            return leftGood || rightGood;
        }
        
        return Dfs(root, 0) ? root : null;
    }
}
