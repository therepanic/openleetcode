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
    public int PathSum(TreeNode root, int targetSum) {
        Dictionary<long, int> prefixSums = new Dictionary<long, int>();
        prefixSums[0] = 1;
        return Dfs(root, 0L, targetSum, prefixSums);
    }
    
    private int Dfs(TreeNode node, long currentSum, int targetSum, Dictionary<long, int> prefixSums) {
        if (node == null) return 0;
        currentSum += node.val;
        int count = prefixSums.ContainsKey(currentSum - targetSum) ? prefixSums[currentSum - targetSum] : 0;
        if (prefixSums.ContainsKey(currentSum)) {
            prefixSums[currentSum]++;
        } else {
            prefixSums[currentSum] = 1;
        }
        count += Dfs(node.left, currentSum, targetSum, prefixSums);
        count += Dfs(node.right, currentSum, targetSum, prefixSums);
        prefixSums[currentSum]--;
        return count;
    }
}
