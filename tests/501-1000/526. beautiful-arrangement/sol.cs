public class Solution {
    public int CountArrangement(int n) {
        bool[] visited = new bool[n + 1];
        return Backtrack(1, n, visited);
    }
    
    private int Backtrack(int index, int n, bool[] visited) {
        if (index > n) {
            return 1;
        }
        int count = 0;
        for (int i = 1; i <= n; i++) {
            if (!visited[i] && (i % index == 0 || index % i == 0)) {
                visited[i] = true;
                count += Backtrack(index + 1, n, visited);
                visited[i] = false;
            }
        }
        return count;
    }
}
