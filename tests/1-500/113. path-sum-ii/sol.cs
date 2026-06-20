
public class Solution {
    public System.Collections.Generic.IList<System.Collections.Generic.IList<int>> PathSum(TreeNode root, int targetSum) {
        var result = new System.Collections.Generic.List<System.Collections.Generic.IList<int>>();
        Dfs(root, targetSum, new System.Collections.Generic.List<int>(), result);
        return result;
    }

    private void Dfs(TreeNode node, int remaining, System.Collections.Generic.List<int> path, System.Collections.Generic.List<System.Collections.Generic.IList<int>> result) {
        if (node == null) return;
        path.Add(node.val);
        remaining -= node.val;
        if (node.left == null && node.right == null && remaining == 0) {
            result.Add(new System.Collections.Generic.List<int>(path));
        } else {
            Dfs(node.left, remaining, path, result);
            Dfs(node.right, remaining, path, result);
        }
        path.RemoveAt(path.Count - 1);
    }
}
