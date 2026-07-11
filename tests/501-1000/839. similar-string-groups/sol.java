class Solution {
    private boolean checkSimilarity(String str1, String str2) {
        int diff = 0;
        for (int i = 0; i < str1.length(); i++) {
            if (str1.charAt(i) != str2.charAt(i)) {
                diff++;
            }
        }
        return diff == 0 || diff == 2;
    }
    
    private void dfs(int node, List<List<Integer>> matrix, boolean[] visited) {
        if (visited[node]) {
            return;
        }
        visited[node] = true;
        for (int nei : matrix.get(node)) {
            if (!visited[nei]) {
                dfs(nei, matrix, visited);
            }
        }
    }
    
    public int numSimilarGroups(String[] strs) {
        int n = strs.length;
        List<List<Integer>> matrix = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            matrix.add(new ArrayList<>());
        }
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (checkSimilarity(strs[i], strs[j])) {
                    matrix.get(i).add(j);
                    matrix.get(j).add(i);
                }
            }
        }
        
        int count = 0;
        boolean[] visited = new boolean[n];
        for (int start = 0; start < n; start++) {
            if (!visited[start]) {
                dfs(start, matrix, visited);
                count++;
            }
        }
        
        return count;
    }
}
