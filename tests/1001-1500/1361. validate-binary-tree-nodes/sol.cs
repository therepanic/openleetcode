public class Solution {
    public bool ValidateBinaryTreeNodes(int n, int[] leftChild, int[] rightChild) {
        int[] inDegree = new int[n];
        for (int i = 0; i < n; i++) {
            foreach (int child in new int[] { leftChild[i], rightChild[i] }) {
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

        Queue<int> queue = new Queue<int>();
        bool[] visited = new bool[n];
        queue.Enqueue(root);
        visited[root] = true;
        int count = 1;

        while (queue.Count > 0) {
            int node = queue.Dequeue();
            foreach (int child in new int[] { leftChild[node], rightChild[node] }) {
                if (child == -1) continue;
                if (visited[child]) return false;
                visited[child] = true;
                count++;
                queue.Enqueue(child);
            }
        }
        return count == n;
    }
}
