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
    public int KthSmallest(TreeNode root, int k) {
        List<int> sortedElements = InorderTraversal(root);
        return sortedElements[k - 1];
    }
    
    private List<int> InorderTraversal(TreeNode node) {
        if (node == null) return new List<int>();
        List<int> left = InorderTraversal(node.left);
        List<int> right = InorderTraversal(node.right);
        left.Add(node.val);
        left.AddRange(right);
        return left;
    }
}
