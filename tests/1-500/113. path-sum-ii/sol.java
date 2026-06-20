
class Solution {
    public java.util.List<java.util.List<Integer>> pathSum(TreeNode root, int targetSum) {
        java.util.List<java.util.List<Integer>> result = new java.util.ArrayList<>();
        dfs(root, targetSum, new java.util.ArrayList<>(), result);
        return result;
    }

    private void dfs(TreeNode node, int remaining, java.util.List<Integer> path, java.util.List<java.util.List<Integer>> result) {
        if (node == null) return;
        path.add(node.val);
        remaining -= node.val;
        if (node.left == null && node.right == null && remaining == 0) {
            result.add(new java.util.ArrayList<>(path));
        } else {
            dfs(node.left, remaining, path, result);
            dfs(node.right, remaining, path, result);
        }
        path.remove(path.size() - 1);
    }
}
