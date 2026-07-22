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
    public int DeepestLeavesSum(TreeNode root) {
        Dictionary<int, int> depthMap = new Dictionary<int, int>();
        DFS(root, 0, depthMap);
        int maxDepth = 0;
        foreach (int depth in depthMap.Keys) {
            if (depth > maxDepth) maxDepth = depth;
        }
        return depthMap[maxDepth];
    }
    
    private void DFS(TreeNode node, int depth, Dictionary<int, int> depthMap) {
        if (node == null) return;
        if (node.left == null && node.right == null) {
            if (depthMap.ContainsKey(depth)) {
                depthMap[depth] += node.val;
            } else {
                depthMap[depth] = node.val;
            }
        }
        DFS(node.left, depth + 1, depthMap);
        DFS(node.right, depth + 1, depthMap);
    }
}
