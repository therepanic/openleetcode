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
    public TreeNode SubtreeWithAllDeepest(TreeNode root) {
        if (root == null) return null;
        
        Dictionary<TreeNode, TreeNode> parent = new Dictionary<TreeNode, TreeNode>();
        parent[root] = null;
        Queue<TreeNode> q = new Queue<TreeNode>();
        q.Enqueue(root);
        List<TreeNode> lastLevel = new List<TreeNode>();
        
        while (q.Count > 0) {
            int size = q.Count;
            lastLevel = new List<TreeNode>();
            for (int i = 0; i < size; i++) {
                TreeNode node = q.Dequeue();
                lastLevel.Add(node);
                if (node.left != null) {
                    parent[node.left] = node;
                    q.Enqueue(node.left);
                }
                if (node.right != null) {
                    parent[node.right] = node;
                    q.Enqueue(node.right);
                }
            }
        }
        
        HashSet<TreeNode> deepest = new HashSet<TreeNode>(lastLevel);
        while (deepest.Count > 1) {
            HashSet<TreeNode> next = new HashSet<TreeNode>();
            foreach (TreeNode node in deepest) {
                next.Add(parent[node]);
            }
            deepest = next;
        }
        
        foreach (TreeNode node in deepest) {
            return node;
        }
        return null;
    }
}
