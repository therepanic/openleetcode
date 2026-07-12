class Solution {
    public int findJudge(int n, int[][] trust) {
        int[] indegree = new int[n + 1];
        int[] outdegree = new int[n + 1];
        for (int[] edge : trust) {
            int a = edge[0];
            int b = edge[1];
            outdegree[a]++;
            indegree[b]++;
        }
        for (int i = 1; i <= n; i++) {
            if (outdegree[i] == 0 && indegree[i] == n - 1) {
                return i;
            }
        }
        return -1;
    }
}
