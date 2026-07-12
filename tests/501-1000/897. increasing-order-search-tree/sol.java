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
    public TreeNode increasingBST(TreeNode root) {
        List<Integer> vals = new ArrayList<>();
        inord(root, vals);
        return create(vals, 0);
    }
    
    private TreeNode create(List<Integer> vals, int i) {
        if (i >= vals.size()) return null;
        TreeNode node = new TreeNode(vals.get(i));
        node.right = create(vals, i + 1);
        return node;
    }
    
    private void inord(TreeNode root, List<Integer> vals) {
        if (root == null) return;
        inord(root.left, vals);
        vals.add(root.val);
        inord(root.right, vals);
    }
}
