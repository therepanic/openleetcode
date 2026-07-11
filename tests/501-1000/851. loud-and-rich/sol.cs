public class Solution {
    public int[] LoudAndRich(int[][] richer, int[] quiet) {
        int n = quiet.Length;
        List<int>[] graph = new List<int>[n];
        for (int i = 0; i < n; i++) {
            graph[i] = new List<int>();
        }
        foreach (var pair in richer) {
            graph[pair[1]].Add(pair[0]);
        }
        
        int[] answer = new int[n];
        Array.Fill(answer, -1);
        
        int Dfs(int i) {
            if (answer[i] != -1) return answer[i];
            answer[i] = i;
            foreach (int nei in graph[i]) {
                int item = Dfs(nei);
                if (quiet[item] < quiet[answer[i]]) {
                    answer[i] = item;
                }
            }
            return answer[i];
        }
        
        for (int i = 0; i < n; i++) {
            Dfs(i);
        }
        return answer;
    }
}
