class Solution {
    public boolean validateBinaryTreeNodes(int n, int[] leftChild, int[] rightChild) {
        int[] inDegree = new int[n];
        for (int i = 0; i < n; i++) {
            int[] children = {leftChild[i], rightChild[i]};
            for (int child : children) {
                if (child != -1) {
                    if (child < 0 || child >= n) return false;
                    inDegree[child]++;
                    if (inDegree[child] > 1) return false;
                }
            }
        }

        int root = -1;
        for (int i = 0; i < n; i++) {
            if (inDegree[i] == 0) {
                if (root != -1) return false;
                root = i;
            }
        }
        if (root == -1) return false;

        java.util.Queue<Integer> queue = new java.util.LinkedList<>();
        boolean[] visited = new boolean[n];
        queue.offer(root);
        visited[root] = true;
        int count = 1;

        while (!queue.isEmpty()) {
            int node = queue.poll();
            int[] children = {leftChild[node], rightChild[node]};
            for (int child : children) {
                if (child == -1) continue;
                if (visited[child]) return false;
                visited[child] = true;
                count++;
                queue.offer(child);
            }
        }
        return count == n;
    }
}
