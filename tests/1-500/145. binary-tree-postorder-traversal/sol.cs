public class Solution {
    public System.Collections.Generic.IList<int> PostorderTraversal(TreeNode root) {
        var result = new System.Collections.Generic.List<int>();
        if (root == null) return result;

        var stack = new System.Collections.Generic.Stack<TreeNode>();
        stack.Push(root);
        while (stack.Count > 0) {
            var node = stack.Pop();
            result.Add(node.val);
            if (node.left != null) stack.Push(node.left);
            if (node.right != null) stack.Push(node.right);
        }
        result.Reverse();
        return result;
    }
}
