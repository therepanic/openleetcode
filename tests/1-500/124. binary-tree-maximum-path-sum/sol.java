class Solution {
    private int best;

    public int maxPathSum(TreeNode root) {
        best = root.val;
        dfs(root);
        return best;
    }

    private int dfs(TreeNode node) {
        if (node == null) {
            return 0;
        }
        int left = Math.max(dfs(node.left), 0);
        int right = Math.max(dfs(node.right), 0);
        best = Math.max(best, node.val + left + right);
        return node.val + Math.max(left, right);
    }
}
