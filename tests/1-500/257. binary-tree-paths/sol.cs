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
    public IList<string> BinaryTreePaths(TreeNode root) {
        IList<string> res = new List<string>();
        if (root == null) {
            return res;
        }
        Stack<(TreeNode, string)> stack = new Stack<(TreeNode, string)>();
        stack.Push((root, root.val.ToString()));
        while (stack.Count > 0) {
            var (node, path) = stack.Pop();
            if (node.left == null && node.right == null) {
                res.Add(path);
            }
            if (node.right != null) {
                stack.Push((node.right, path + "->" + node.right.val.ToString()));
            }
            if (node.left != null) {
                stack.Push((node.left, path + "->" + node.left.val.ToString()));
            }
        }
        return res;
    }
}
