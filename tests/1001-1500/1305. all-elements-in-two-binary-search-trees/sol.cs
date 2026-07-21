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
    public IList<int> GetAllElements(TreeNode root1, TreeNode root2) {
        Stack<TreeNode> stack1 = new Stack<TreeNode>();
        Stack<TreeNode> stack2 = new Stack<TreeNode>();
        List<int> output = new List<int>();
        
        while (root1 != null || root2 != null || stack1.Count > 0 || stack2.Count > 0) {
            while (root1 != null) {
                stack1.Push(root1);
                root1 = root1.left;
            }
            while (root2 != null) {
                stack2.Push(root2);
                root2 = root2.left;
            }

            if (stack1.Count > 0 && stack2.Count > 0) {
                if (stack1.Peek().val <= stack2.Peek().val) {
                    root1 = stack1.Pop();
                    output.Add(root1.val);
                    root1 = root1.right;
                } else {
                    root2 = stack2.Pop();
                    output.Add(root2.val);
                    root2 = root2.right;
                }
            } else if (stack1.Count == 0) {
                root2 = stack2.Pop();
                output.Add(root2.val);
                root2 = root2.right;
            } else {
                root1 = stack1.Pop();
                output.Add(root1.val);
                root1 = root1.right;
            }
        }
        
        return output;
    }
}
