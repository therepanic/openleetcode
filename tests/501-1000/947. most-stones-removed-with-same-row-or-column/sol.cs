public class Solution {
    public int RemoveStones(int[][] stones) {
        int n = stones.Length;
        List<int>[] matrix = new List<int>[n];
        for (int i = 0; i < n; i++) {
            matrix[i] = new List<int>();
        }
        
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                if (stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1]) {
                    matrix[i].Add(j);
                    matrix[j].Add(i);
                }
            }
        }
        
        bool[] visited = new bool[n];
        int components = 0;
        
        void Dfs(int idx) {
            visited[idx] = true;
            foreach (int nei in matrix[idx]) {
                if (!visited[nei]) {
                    Dfs(nei);
                }
            }
        }
        
        for (int i = 0; i < n; i++) {
            if (!visited[i]) {
                components++;
                Dfs(i);
            }
        }
        
        return n - components;
    }
}
