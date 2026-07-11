public class Solution {
    public int ReachableNodes(int[][] edges, int maxMoves, int n) {
        var graph = new List<(int, int)>[n];
        for (int i = 0; i < n; i++) {
            graph[i] = new List<(int, int)>();
        }
        var dist = new int[n];
        Array.Fill(dist, maxMoves + 1);
        
        foreach (var edge in edges) {
            int u = edge[0], v = edge[1], cnt = edge[2];
            graph[u].Add((v, cnt));
            graph[v].Add((u, cnt));
        }
        
        int Dijkstra() {
            dist[0] = 0;
            var minHeap = new SortedSet<(int, int)>();
            minHeap.Add((0, 0));
            
            while (minHeap.Count > 0) {
                var curr = minHeap.Min;
                minHeap.Remove(curr);
                int d = curr.Item1, u = curr.Item2;
                
                if (dist[u] >= maxMoves) break;
                
                foreach (var (v, w) in graph[u]) {
                    int newDist = d + w + 1;
                    if (newDist < dist[v]) {
                        if (dist[v] != maxMoves + 1) {
                            minHeap.Remove((dist[v], v));
                        }
                        dist[v] = newDist;
                        minHeap.Add((newDist, v));
                    }
                }
            }
            
            int count = 0;
            foreach (int d in dist) {
                if (d <= maxMoves) count++;
            }
            return count;
        }
        
        int reachableNodes = Dijkstra();
        int reachableSubnodes = 0;
        
        foreach (var edge in edges) {
            int u = edge[0], v = edge[1], cnt = edge[2];
            int a = dist[u] > maxMoves ? 0 : Math.Min(maxMoves - dist[u], cnt);
            int b = dist[v] > maxMoves ? 0 : Math.Min(maxMoves - dist[v], cnt);
            reachableSubnodes += Math.Min(a + b, cnt);
        }
        
        return reachableNodes + reachableSubnodes;
    }
}
