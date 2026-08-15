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
    public int countPairs(TreeNode root, int distance) {
        Map<TreeNode, List<TreeNode>> graph = new HashMap<>();
        dfs(root, null, graph);

        List<TreeNode> leaves = new ArrayList<>();
        for (TreeNode node : graph.keySet()) {
            if (node.left == null && node.right == null) {
                leaves.add(node);
            }
        }

        int ans = 0;
        for (int i = 0; i < leaves.size(); i++) {
            TreeNode leaf = leaves.get(i);
            Queue<TreeNode> nodeQueue = new LinkedList<>();
            Queue<Integer> distQueue = new LinkedList<>();
            Set<TreeNode> visited = new HashSet<>();
            nodeQueue.offer(leaf);
            distQueue.offer(0);
            visited.add(leaf);

            while (!nodeQueue.isEmpty()) {
                TreeNode node = nodeQueue.poll();
                int dist = distQueue.poll();
                if (dist >= distance) continue;
                for (TreeNode nei : graph.getOrDefault(node, new ArrayList<>())) {
                    if (!visited.contains(nei)) {
                        visited.add(nei);
                        nodeQueue.offer(nei);
                        distQueue.offer(dist + 1);
                        if (leaves.contains(nei) && leaves.indexOf(nei) > i) {
                            ans++;
                        }
                    }
                }
            }
        }
        return ans;
    }

    private void dfs(TreeNode node, TreeNode parent, Map<TreeNode, List<TreeNode>> graph) {
        if (node == null) return;
        if (parent != null) {
            graph.computeIfAbsent(parent, k -> new ArrayList<>()).add(node);
            graph.computeIfAbsent(node, k -> new ArrayList<>()).add(parent);
        }
        dfs(node.left, node, graph);
        dfs(node.right, node, graph);
    }
}
