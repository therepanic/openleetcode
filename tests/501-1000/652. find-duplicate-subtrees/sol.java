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
    private Map<String, Integer> seen = new HashMap<>();
    private List<TreeNode> ans = new ArrayList<>();
    
    public List<TreeNode> findDuplicateSubtrees(TreeNode root) {
        solve(root);
        return ans;
    }
    
    private String solve(TreeNode node) {
        if (node == null) {
            return "#";
        }
        String left = solve(node.left);
        String right = solve(node.right);
        String currTree = node.val + ", " + left + ", " + right;
        seen.put(currTree, seen.getOrDefault(currTree, 0) + 1);
        if (seen.get(currTree) == 2) {
            ans.add(node);
        }
        return currTree;
    }
}
