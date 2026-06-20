public class Solution {
    public long SumNumbers(TreeNode root) {
        return Dfs(root, 0L);
    }

    private long Dfs(TreeNode node, long current) {
        if (node == null) {
            return 0L;
        }
        current = current * 10 + node.val;
        if (node.left == null && node.right == null) {
            return current;
        }
        return Dfs(node.left, current) + Dfs(node.right, current);
    }
}
