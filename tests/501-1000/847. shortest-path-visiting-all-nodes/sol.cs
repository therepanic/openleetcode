public class Solution {
    public int ShortestPathLength(int[][] graph) {
        int n = graph.Length;
        if (n == 1) return 0;
        
        int FULL = (1 << n) - 1;
        bool[][] visited = new bool[n][];
        for (int i = 0; i < n; i++) {
            visited[i] = new bool[1 << n];
        }
        
        var q = new Queue<(int node, int mask, int dist)>();
        
        for (int i = 0; i < n; i++) {
            int mask = 1 << i;
            q.Enqueue((i, mask, 0));
            visited[i][mask] = true;
        }
        
        while (q.Count > 0) {
            var (node, mask, dist) = q.Dequeue();
            
            if (mask == FULL) return dist;
            
            foreach (int nei in graph[node]) {
                int newMask = mask | (1 << nei);
                
                if (!visited[nei][newMask]) {
                    visited[nei][newMask] = true;
                    q.Enqueue((nei, newMask, dist + 1));
                }
            }
        }
        
        return -1;
    }
}
