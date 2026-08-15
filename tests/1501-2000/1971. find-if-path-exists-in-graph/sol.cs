public class Solution {
    public bool ValidPath(int n, int[][] edges, int source, int destination) {
        if (source == destination) return true;
        var graph = new Dictionary<int, List<int>>();
        foreach (var edge in edges) {
            if (!graph.ContainsKey(edge[0])) graph[edge[0]] = new List<int>();
            if (!graph.ContainsKey(edge[1])) graph[edge[1]] = new List<int>();
            graph[edge[0]].Add(edge[1]);
            graph[edge[1]].Add(edge[0]);
        }
        var queue = new Queue<int>();
        var visited = new HashSet<int>();
        queue.Enqueue(source);
        visited.Add(source);
        while (queue.Count > 0) {
            int node = queue.Dequeue();
            if (node == destination) return true;
            if (graph.ContainsKey(node)) {
                foreach (int neighbor in graph[node]) {
                    if (visited.Add(neighbor)) {
                        queue.Enqueue(neighbor);
                    }
                }
            }
        }
        return false;
    }
}
