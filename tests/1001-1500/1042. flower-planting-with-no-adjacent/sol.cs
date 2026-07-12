public class Solution {
    public int[] GardenNoAdj(int n, int[][] paths) {
        Dictionary<int, List<int>> graph = new Dictionary<int, List<int>>();
        
        foreach (var path in paths) {
            int u = path[0];
            int v = path[1];
            if (!graph.ContainsKey(u)) graph[u] = new List<int>();
            if (!graph.ContainsKey(v)) graph[v] = new List<int>();
            graph[u].Add(v);
            graph[v].Add(u);
        }
        
        for (int node = 1; node <= n; node++) {
            if (!graph.ContainsKey(node)) {
                graph[node] = new List<int>();
            }
        }
        
        int[] answer = new int[n + 1];
        
        for (int i = 1; i <= n; i++) {
            HashSet<int> used = new HashSet<int>();
            foreach (int nei in graph[i]) {
                used.Add(answer[nei]);
            }
            
            for (int flower = 1; flower <= 4; flower++) {
                if (!used.Contains(flower)) {
                    answer[i] = flower;
                    break;
                }
            }
        }
        
        return answer.Skip(1).ToArray();
    }
}
