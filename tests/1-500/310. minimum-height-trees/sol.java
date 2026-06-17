class Solution {
    public List<Integer> findMinHeightTrees(int n, int[][] edges) {
        if (n < 3) {
            List<Integer> result = new ArrayList<>();
            for (int i = 0; i < n; i++) {
                result.add(i);
            }
            return result;
        }

        List<Set<Integer>> adjacencyList = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            adjacencyList.add(new HashSet<>());
        }
        for (int[] edge : edges) {
            int a = edge[0], b = edge[1];
            adjacencyList.get(a).add(b);
            adjacencyList.get(b).add(a);
        }

        List<Integer> leaves = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            if (adjacencyList.get(i).size() == 1) {
                leaves.add(i);
            }
        }

        while (n > 2) {
            n -= leaves.size();
            List<Integer> newLeaves = new ArrayList<>();
            for (int leaf : leaves) {
                int neighbor = adjacencyList.get(leaf).iterator().next();
                adjacencyList.get(neighbor).remove(leaf);
                if (adjacencyList.get(neighbor).size() == 1) {
                    newLeaves.add(neighbor);
                }
            }
            leaves = newLeaves;
        }

        return leaves;
    }
}
