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
    private int findHeight(TreeNode node) {
        if (node == null) {
            return 0;
        }
        int height = 0;
        if (node.left != null) {
            height = Math.max(height, 1 + findHeight(node.left));
        }
        if (node.right != null) {
            height = Math.max(height, 1 + findHeight(node.right));
        }
        return height;
    }

    public List<List<String>> printTree(TreeNode root) {
        int height = findHeight(root);
        int m = height + 1;
        int n = (1 << (height + 1)) - 1;
        List<List<String>> matrix = new ArrayList<>();
        for (int i = 0; i < m; i++) {
            List<String> row = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                row.add("");
            }
            matrix.add(row);
        }
        Queue<Object[]> queue = new LinkedList<>();
        queue.add(new Object[]{root, 0, (n - 1) / 2});
        while (!queue.isEmpty()) {
            int levelSize = queue.size();
            for (int i = 0; i < levelSize; i++) {
                Object[] front = queue.poll();
                TreeNode frontNode = (TreeNode) front[0];
                int x = (int) front[1];
                int y = (int) front[2];
                matrix.get(x).set(y, String.valueOf(frontNode.val));
                if (frontNode.left != null) {
                    queue.add(new Object[]{frontNode.left, x + 1, y - (1 << (height - x - 1))});
                }
                if (frontNode.right != null) {
                    queue.add(new Object[]{frontNode.right, x + 1, y + (1 << (height - x - 1))});
                }
            }
        }
        return matrix;
    }
}
