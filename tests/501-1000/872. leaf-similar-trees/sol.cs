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
    public bool LeafSimilar(TreeNode root1, TreeNode root2) {
        void Helper(TreeNode root, IList<int> leaves) {
            if (root == null) {
                return;
            }
            Stack<TreeNode> stack = new Stack<TreeNode>();
            stack.Push(root);
            while (stack.Count > 0) {
                TreeNode curr = stack.Pop();
                if (curr.left == null && curr.right == null) {
                    leaves.Add(curr.val);
                }
                if (curr.right != null) {
                    stack.Push(curr.right);
                }
                if (curr.left != null) {
                    stack.Push(curr.left);
                }
            }
        }
        List<int> leaves1 = new List<int>();
        List<int> leaves2 = new List<int>();
        Helper(root1, leaves1);
        Helper(root2, leaves2);
        return leaves1.SequenceEqual(leaves2);
    }
}
