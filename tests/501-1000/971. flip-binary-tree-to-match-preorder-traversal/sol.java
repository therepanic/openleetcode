/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    private List<Integer> flippedNodes;
    private int idx;
    private int[] voyage;
    
    public List<Integer> flipMatchVoyage(TreeNode root, int[] voyage) {
        flippedNodes = new ArrayList<>();
        idx = 0;
        this.voyage = voyage;
        
        if (!dfs(root)) {
            List<Integer> result = new ArrayList<>();
            result.add(-1);
            return result;
        }
        return flippedNodes;
    }
    
    private boolean dfs(TreeNode node) {
        if (node == null) return true;
        if (node.val != voyage[idx]) return false;
        
        idx++;
        if (node.left != null && node.right != null) {
            if (voyage[idx] == node.right.val) {
                flippedNodes.add(node.val);
                if (!dfs(node.right)) return false;
                if (!dfs(node.left)) return false;
            } else if (voyage[idx] == node.left.val) {
                if (!dfs(node.left)) return false;
                if (!dfs(node.right)) return false;
            } else {
                return false;
            }
        } else {
            if (node.left != null) {
                if (!dfs(node.left)) return false;
            } else if (node.right != null) {
                if (!dfs(node.right)) return false;
            }
        }
        return true;
    }
}
