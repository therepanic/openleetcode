public class Solution {
    public IList<IList<int>> CriticalConnections(int n, IList<IList<int>> connections) {
        List<int>[] graph = new List<int>[n];
        for (int i = 0; i < n; i++) {
            graph[i] = new List<int>();
        }
        foreach (var edge in connections) {
            int u = edge[0], v = edge[1];
            graph[u].Add(v);
            graph[v].Add(u);
        }
        
        int[] disc = new int[n];
        int[] low = new int[n];
        Array.Fill(disc, -1);
        int timer = 0;
        IList<IList<int>> bridges = new List<IList<int>>();
        int[] iterIdx = new int[n];
        
        for (int start = 0; start < n; start++) {
            if (disc[start] != -1) continue;
            
            Stack<(int node, int parent)> stack = new Stack<(int, int)>();
            disc[start] = low[start] = timer++;
            stack.Push((start, -1));
            
            while (stack.Count > 0) {
                var (node, parent) = stack.Peek();
                var neighbors = graph[node];
                
                if (iterIdx[node] < neighbors.Count) {
                    int nb = neighbors[iterIdx[node]++];
                    if (nb == parent) continue;
                    
                    if (disc[nb] == -1) {
                        disc[nb] = low[nb] = timer++;
                        stack.Push((nb, node));
                    } else {
                        low[node] = Math.Min(low[node], disc[nb]);
                    }
                } else {
                    stack.Pop();
                    if (stack.Count > 0) {
                        int par = stack.Peek().node;
                        low[par] = Math.Min(low[par], low[node]);
                        if (low[node] > disc[par]) {
                            bridges.Add(new List<int> { par, node });
                        }
                    }
                }
            }
        }
        
        return bridges;
    }
}
