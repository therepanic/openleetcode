
class Solution {
    public int minDepth(TreeNode root) {
        if (root == null) return 0;
        java.util.ArrayDeque<Object[]> queue = new java.util.ArrayDeque<>();
        queue.add(new Object[] {root, 1});
        while (!queue.isEmpty()) {
            Object[] item = queue.remove();
            TreeNode node = (TreeNode) item[0];
            int depth = (Integer) item[1];
            if (node.left == null && node.right == null) return depth;
            if (node.left != null) queue.add(new Object[] {node.left, depth + 1});
            if (node.right != null) queue.add(new Object[] {node.right, depth + 1});
        }
        return 0;
    }
}
