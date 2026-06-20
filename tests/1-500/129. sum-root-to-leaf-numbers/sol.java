class Solution {
    public long sumNumbers(TreeNode root) {
        return dfs(root, 0L);
    }

    private long dfs(TreeNode node, long current) {
        if (node == null) {
            return 0L;
        }
        current = current * 10 + node.val;
        if (node.left == null && node.right == null) {
            return current;
        }
        return dfs(node.left, current) + dfs(node.right, current);
    }
}
