class Solution {
    public double frogPosition(int n, int[][] edges, int t, int target) {
        Map<Integer, Set<Integer>> neighbors = new HashMap<>();
        for (int i = 1; i <= n; i++) {
            neighbors.put(i, new HashSet<>());
        }
        for (int[] edge : edges) {
            int a = edge[0], b = edge[1];
            neighbors.get(a).add(b);
            neighbors.get(b).add(a);
        }
        
        return dfs(1, 1.0, 0, t, target, neighbors, new HashSet<>());
    }
    
    private double dfs(int vertex, double chance, int elapsed, int t, int target,
                       Map<Integer, Set<Integer>> neighbors, Set<Integer> visited) {
        if (elapsed == t) {
            return vertex == target ? chance : 0.0;
        }
        visited.add(vertex);
        Set<Integer> choices = new HashSet<>(neighbors.get(vertex));
        choices.removeAll(visited);
        
        if (choices.isEmpty()) {
            return dfs(vertex, chance, elapsed + 1, t, target, neighbors, visited);
        } else {
            for (int child : choices) {
                double result = dfs(child, chance / choices.size(), elapsed + 1, t, target, neighbors, visited);
                if (result > 0) return result;
            }
        }
        return 0.0;
    }
}
