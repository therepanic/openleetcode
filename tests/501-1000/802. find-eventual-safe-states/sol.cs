public class Solution {
    public IList<int> EventualSafeNodes(int[][] graph) {
        int n = graph.Length;
        int[] state = new int[n]; // 0: unvisited, 1: visiting, 2: safe
        List<int> safe = new List<int>();
        
        bool Dfs(int node) {
            if (state[node] > 0) {
                return state[node] == 2;
            }
            
            state[node] = 1;
            
            foreach (int neighbor in graph[node]) {
                if (state[neighbor] == 1 || !Dfs(neighbor)) {
                    return false;
                }
            }
            
            state[node] = 2;
            return true;
        }
        
        for (int i = 0; i < n; i++) {
            if (Dfs(i)) {
                safe.Add(i);
            }
        }
        
        return safe;
    }
}
