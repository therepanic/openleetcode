class Solution {
    public List<Boolean> checkIfPrerequisite(int n, int[][] prerequisites, int[][] queries) {
        boolean[][] reach = new boolean[n][n];
        for (int[] edge : prerequisites) reach[edge[0]][edge[1]] = true;
        for (int k = 0; k < n; k++)
            for (int i = 0; i < n; i++)
                if (reach[i][k])
                    for (int j = 0; j < n; j++) reach[i][j] |= reach[k][j];
        List<Boolean> answer = new ArrayList<>();
        for (int[] query : queries) answer.add(reach[query[0]][query[1]]);
        return answer;
    }
}
