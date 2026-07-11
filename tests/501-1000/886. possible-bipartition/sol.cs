public class Solution {
    public bool PossibleBipartition(int n, int[][] dislikes) {
        Dictionary<int, List<int>> graph = new Dictionary<int, List<int>>();
        foreach (var edge in dislikes) {
            int u = edge[0], v = edge[1];
            if (!graph.ContainsKey(u)) graph[u] = new List<int>();
            if (!graph.ContainsKey(v)) graph[v] = new List<int>();
            graph[u].Add(v);
            graph[v].Add(u);
        }
        
        int[] color = new int[n + 1];
        
        for (int node = 1; node <= n; node++) {
            if (color[node] != 0 || !graph.ContainsKey(node)) {
                continue;
            }
            
            Queue<int> queue = new Queue<int>();
            queue.Enqueue(node);
            color[node] = 1;
            
            while (queue.Count > 0) {
                int curr = queue.Dequeue();
                
                foreach (int neighbor in graph[curr]) {
                    if (color[neighbor] == color[curr]) {
                        return false;
                    }
                    
                    if (color[neighbor] == 0) {
                        color[neighbor] = -color[curr];
                        queue.Enqueue(neighbor);
                    }
                }
            }
        }
        
        return true;
    }
}
