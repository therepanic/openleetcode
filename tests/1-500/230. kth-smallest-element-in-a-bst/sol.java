/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public int kthSmallest(TreeNode root, int k) {
        List<Integer> sortedElements = inorderTraversal(root);
        return sortedElements.get(k - 1);
    }
    
    private List<Integer> inorderTraversal(TreeNode node) {
        List<Integer> result = new ArrayList<>();
        if (node == null) return result;
        result.addAll(inorderTraversal(node.left));
        result.add(node.val);
        result.addAll(inorderTraversal(node.right));
        return result;
    }
}
