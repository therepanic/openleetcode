class Solution {
    @SuppressWarnings("unchecked")
    public int[] findRedundantConnection(int[][] edges) {
        int n = edges.length;
        List<Integer>[] matrix = new ArrayList[n + 1];
        for (int i = 0; i <= n; i++) {
            matrix[i] = new ArrayList<>();
        }
        for (int[] edge : edges) {
            int a = edge[0], b = edge[1];
            matrix[a].add(b);
            matrix[b].add(a);
        }

        Set<Integer> visited = new HashSet<>();
        Set<Integer> path = new HashSet<>();
        int[] cycleStart = {-1};

        java.util.function.BiFunction<Integer, Integer, Boolean> dfs = new java.util.function.BiFunction<>() {
            @Override
            public Boolean apply(Integer i, Integer parent) {
                if (visited.contains(i)) return false;
                visited.add(i);
                for (int node : matrix[i]) {
                    if (!visited.contains(node)) {
                        if (this.apply(node, i)) {
                            if (cycleStart[0] != -1) {
                                path.add(node);
                            }
                            if (node == cycleStart[0]) {
                                cycleStart[0] = -1;
                            }
                            return true;
                        }
                    } else if (node != parent) {
                        path.add(node);
                        cycleStart[0] = node;
                        return true;
                    }
                }
                return false;
            }
        };

        for (int i = n; i >= 1; i--) {
            if (dfs.apply(i, -1)) break;
        }

        for (int k = n - 1; k >= 0; k--) {
            int a = edges[k][0], b = edges[k][1];
            if (path.contains(a) && path.contains(b)) {
                return new int[]{a, b};
            }
        }
        return new int[0];
    }
}
