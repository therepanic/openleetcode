public class Solution {
    private int _best;

    public int MaxPathSum(TreeNode root) {
        _best = root.val;
        Dfs(root);
        return _best;
    }

    private int Dfs(TreeNode node) {
        if (node == null) {
            return 0;
        }
        int left = System.Math.Max(Dfs(node.left), 0);
        int right = System.Math.Max(Dfs(node.right), 0);
        _best = System.Math.Max(_best, node.val + left + right);
        return node.val + System.Math.Max(left, right);
    }
}
