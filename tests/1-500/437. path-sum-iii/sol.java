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
    public int pathSum(TreeNode root, int targetSum) {
        Map<Long, Integer> prefixSums = new HashMap<>();
        prefixSums.put(0L, 1);
        return dfs(root, 0L, targetSum, prefixSums);
    }
    
    private int dfs(TreeNode node, long currentSum, int targetSum, Map<Long, Integer> prefixSums) {
        if (node == null) {
            return 0;
        }
        currentSum += node.val;
        int count = prefixSums.getOrDefault(currentSum - targetSum, 0);
        prefixSums.put(currentSum, prefixSums.getOrDefault(currentSum, 0) + 1);
        count += dfs(node.left, currentSum, targetSum, prefixSums);
        count += dfs(node.right, currentSum, targetSum, prefixSums);
        prefixSums.put(currentSum, prefixSums.get(currentSum) - 1);
        return count;
    }
}
