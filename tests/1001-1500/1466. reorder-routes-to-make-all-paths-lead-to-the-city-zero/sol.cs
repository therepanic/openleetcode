public class Solution {
    public int MinReorder(int n, int[][] connections) {
        HashSet<string> roads = new HashSet<string>();
        List<int>[] graph = new List<int>[n];
        for (int i = 0; i < n; i++) {
            graph[i] = new List<int>();
        }
        foreach (var conn in connections) {
            int x = conn[0], y = conn[1];
            graph[x].Add(y);
            graph[y].Add(x);
            roads.Add($"{x},{y}");
        }
        
        bool[] seen = new bool[n];
        seen[0] = true;
        
        int Dfs(int node) {
            int ans = 0;
            foreach (int neighbor in graph[node]) {
                if (!seen[neighbor]) {
                    if (roads.Contains($"{node},{neighbor}")) {
                        ans++;
                    }
                    seen[neighbor] = true;
                    ans += Dfs(neighbor);
                }
            }
            return ans;
        }
        
        return Dfs(0);
    }
}
