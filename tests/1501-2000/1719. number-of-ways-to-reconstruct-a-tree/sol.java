class Solution {
    public int checkWays(int[][] pairs) {
        Map<Integer, Set<Integer>> graph = new HashMap<>();
        for (int[] p : pairs) {
            graph.computeIfAbsent(p[0], k -> new HashSet<>()).add(p[1]);
            graph.computeIfAbsent(p[1], k -> new HashSet<>()).add(p[0]);
        }
        if (graph.isEmpty()) return 0;
        int root = -1;
        int maxSize = -1;
        for (Map.Entry<Integer, Set<Integer>> entry : graph.entrySet()) {
            if (entry.getValue().size() > maxSize) {
                maxSize = entry.getValue().size();
                root = entry.getKey();
            }
        }
        if (graph.get(root).size() != graph.size() - 1) return 0;

        int ans = 1;
        for (Map.Entry<Integer, Set<Integer>> entry : graph.entrySet()) {
            int node = entry.getKey();
            Set<Integer> neighbors = entry.getValue();
            if (node == root) continue;
            List<Integer> parents = new ArrayList<>();
            for (int cand : neighbors) {
                if (graph.get(cand).size() >= neighbors.size()) parents.add(cand);
            }
            if (parents.isEmpty()) return 0;
            int parent = parents.get(0);
            for (int cand : parents) {
                if (graph.get(cand).size() < graph.get(parent).size()) parent = cand;
            }
            Set<Integer> union = new HashSet<>(graph.get(parent));
            union.add(parent);
            if (!union.containsAll(neighbors)) return 0;
            if (neighbors.size() == graph.get(parent).size()) ans = 2;
        }
        return ans;
    }
}
