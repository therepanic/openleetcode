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
    public int deepestLeavesSum(TreeNode root) {
        Map<Integer, Integer> depthMap = new HashMap<>();
        dfs(root, 0, depthMap);
        int maxDepth = Collections.max(depthMap.keySet());
        return depthMap.get(maxDepth);
    }
    
    private void dfs(TreeNode node, int depth, Map<Integer, Integer> depthMap) {
        if (node == null) return;
        if (node.left == null && node.right == null) {
            depthMap.put(depth, depthMap.getOrDefault(depth, 0) + node.val);
        }
        dfs(node.left, depth + 1, depthMap);
        dfs(node.right, depth + 1, depthMap);
    }
}
