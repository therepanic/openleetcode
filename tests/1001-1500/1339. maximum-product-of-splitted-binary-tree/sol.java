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
    public int maxProduct(TreeNode root) {
        final int MOD = 1_000_000_007;
        List<TreeNode> nodes = new ArrayList<>();
        Deque<TreeNode> stack = new ArrayDeque<>();
        stack.push(root);

        while (!stack.isEmpty()) {
            TreeNode node = stack.pop();
            if (node != null) {
                nodes.add(node);
                if (node.left != null) stack.push(node.left);
                if (node.right != null) stack.push(node.right);
            }
        }

        Map<TreeNode, Long> sums = new HashMap<>();
        for (int i = nodes.size() - 1; i >= 0; i--) {
            TreeNode node = nodes.get(i);
            long sub = node.val 
                + sums.getOrDefault(node.left, 0L) 
                + sums.getOrDefault(node.right, 0L);
            sums.put(node, sub);
        }

        long total = sums.get(root);
        long best = 0;
        for (long sub : sums.values()) {
            best = Math.max(best, sub * (total - sub));
        }
        return (int)(best % MOD);
    }
}
