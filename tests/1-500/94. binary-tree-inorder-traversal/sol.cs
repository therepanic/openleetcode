using System.Collections.Generic;

public class Solution {
    public IList<int> InorderTraversal(TreeNode root) {
        var result = new List<int>();
        Traverse(root, result);
        return result;
    }

    private void Traverse(TreeNode node, List<int> result) {
        if (node == null) {
            return;
        }
        Traverse(node.left, result);
        result.Add(node.val);
        Traverse(node.right, result);
    }
}
