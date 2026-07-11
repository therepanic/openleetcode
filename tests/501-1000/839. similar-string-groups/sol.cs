public class Solution {
    private bool CheckSimilarity(string str1, string str2) {
        int diff = 0;
        for (int i = 0; i < str1.Length; i++) {
            if (str1[i] != str2[i]) {
                diff++;
            }
        }
        return diff == 0 || diff == 2;
    }
    
    private void Dfs(int node, List<int>[] matrix, bool[] visited) {
        if (visited[node]) {
            return;
        }
        visited[node] = true;
        foreach (int nei in matrix[node]) {
            if (!visited[nei]) {
                Dfs(nei, matrix, visited);
            }
        }
    }
    
    public int NumSimilarGroups(string[] strs) {
        int n = strs.Length;
        List<int>[] matrix = new List<int>[n];
        for (int i = 0; i < n; i++) {
            matrix[i] = new List<int>();
        }
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (CheckSimilarity(strs[i], strs[j])) {
                    matrix[i].Add(j);
                    matrix[j].Add(i);
                }
            }
        }
        
        int count = 0;
        bool[] visited = new bool[n];
        for (int start = 0; start < n; start++) {
            if (!visited[start]) {
                Dfs(start, matrix, visited);
                count++;
            }
        }
        
        return count;
    }
}
