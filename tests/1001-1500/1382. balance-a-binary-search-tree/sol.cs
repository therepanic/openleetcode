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
    public TreeNode BalanceBST(TreeNode root) {
        List<int> vals = new List<int>();
        Inorder(root, vals);
        return Build(vals, 0, vals.Count - 1);
    }
    
    private void Inorder(TreeNode node, List<int> vals) {
        if (node == null) return;
        Inorder(node.left, vals);
        vals.Add(node.val);
        Inorder(node.right, vals);
    }
    
    private TreeNode Build(List<int> vals, int l, int r) {
        if (l > r) return null;
        int mid = (l + r) / 2;
        TreeNode node = new TreeNode(vals[mid]);
        node.left = Build(vals, l, mid - 1);
        node.right = Build(vals, mid + 1, r);
        return node;
    }
}
