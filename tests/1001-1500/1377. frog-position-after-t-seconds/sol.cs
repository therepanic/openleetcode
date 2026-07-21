public class Solution {
    public double FrogPosition(int n, int[][] edges, int t, int target) {
        Dictionary<int, HashSet<int>> neighbors = new Dictionary<int, HashSet<int>>();
        for (int i = 1; i <= n; i++) {
            neighbors[i] = new HashSet<int>();
        }
        foreach (var edge in edges) {
            int a = edge[0], b = edge[1];
            neighbors[a].Add(b);
            neighbors[b].Add(a);
        }
        
        HashSet<int> visited = new HashSet<int>();
        double probability = 0.0;
        
        void dfs(int vertex, double chance, int elapsed) {
            if (elapsed == t) {
                if (vertex == target) {
                    probability = chance;
                }
                return;
            }
            visited.Add(vertex);
            HashSet<int> choices = new HashSet<int>(neighbors[vertex]);
            choices.ExceptWith(visited);
            
            if (choices.Count == 0) {
                dfs(vertex, chance, elapsed + 1);
            } else {
                foreach (int child in choices) {
                    dfs(child, chance / choices.Count, elapsed + 1);
                }
            }
        }
        
        dfs(1, 1.0, 0);
        return probability;
    }
}
