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
    public TreeNode subtreeWithAllDeepest(TreeNode root) {
        if (root == null) return null;
        
        Map<TreeNode, TreeNode> parent = new HashMap<>();
        parent.put(root, null);
        Queue<TreeNode> q = new LinkedList<>();
        q.offer(root);
        List<TreeNode> lastLevel = new ArrayList<>();
        
        while (!q.isEmpty()) {
            int size = q.size();
            lastLevel = new ArrayList<>();
            for (int i = 0; i < size; i++) {
                TreeNode node = q.poll();
                lastLevel.add(node);
                if (node.left != null) {
                    parent.put(node.left, node);
                    q.offer(node.left);
                }
                if (node.right != null) {
                    parent.put(node.right, node);
                    q.offer(node.right);
                }
            }
        }
        
        Set<TreeNode> deepest = new HashSet<>(lastLevel);
        while (deepest.size() > 1) {
            Set<TreeNode> next = new HashSet<>();
            for (TreeNode node : deepest) {
                next.add(parent.get(node));
            }
            deepest = next;
        }
        
        return deepest.iterator().next();
    }
}
