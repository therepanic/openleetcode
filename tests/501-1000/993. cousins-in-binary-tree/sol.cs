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
    public bool IsCousins(TreeNode root, int x, int y) {
        List<(TreeNode parent, int depth)> res = new List<(TreeNode, int)>();
        Stack<(TreeNode curr, TreeNode parent, int depth)> stack = new Stack<(TreeNode, TreeNode, int)>();
        stack.Push((root, null, 0));
        while (stack.Count > 0) {
            var (curr, parent, depth) = stack.Pop();
            if (curr.val == x || curr.val == y) {
                res.Add((parent, depth));
            }
            if (curr.left != null) {
                stack.Push((curr.left, curr, depth + 1));
            }
            if (curr.right != null) {
                stack.Push((curr.right, curr, depth + 1));
            }
        }
        return res.Count == 2 && res[0].depth == res[1].depth && res[0].parent != res[1].parent;
    }
}
