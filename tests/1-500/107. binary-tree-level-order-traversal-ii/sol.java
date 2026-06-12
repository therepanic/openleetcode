
class Solution {
    public java.util.List<java.util.List<Integer>> levelOrderBottom(TreeNode root) {
        java.util.LinkedList<java.util.List<Integer>> result = new java.util.LinkedList<>();
        if (root == null) return result;
        java.util.ArrayDeque<TreeNode> queue = new java.util.ArrayDeque<>();
        queue.add(root);
        while (!queue.isEmpty()) {
            int size = queue.size();
            java.util.List<Integer> level = new java.util.ArrayList<>(size);
            for (int i = 0; i < size; i++) {
                TreeNode node = queue.remove();
                level.add(node.val);
                if (node.left != null) queue.add(node.left);
                if (node.right != null) queue.add(node.right);
            }
            result.addFirst(level);
        }
        return result;
    }
}
