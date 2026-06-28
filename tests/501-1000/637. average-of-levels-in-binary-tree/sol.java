class Solution {
    public List<Double> averageOfLevels(TreeNode root) {
        List<Double> res = new ArrayList<>();
        if (root == null) return res;

        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);

        while (!queue.isEmpty()) {
            double levelSum = 0;
            int count = queue.size();

            for (int i = 0; i < count; i++) {
                TreeNode node = queue.poll();
                levelSum += node.val;
                if (node.left != null) queue.offer(node.left);
                if (node.right != null) queue.offer(node.right);
            }

            res.add(levelSum / count);
        }

        return res;
    }
}
