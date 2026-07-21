class Solution {
    public int minTime(int n, int[][] edges, List<Boolean> hasApple) {
        List<List<Integer>> adj = new ArrayList<>();
        int[] degree = new int[n];
        for (int i = 0; i < n; i++) {
            adj.add(new ArrayList<>());
        }

        for (int[] edge : edges) {
            int u = edge[0], v = edge[1];
            adj.get(u).add(v);
            adj.get(v).add(u);
            degree[u]++;
            degree[v]++;
        }

        Queue<Integer> q = new LinkedList<>();
        for (int i = 1; i < n; i++) {
            if (degree[i] == 1 && !hasApple.get(i)) {
                q.offer(i);
            }
        }

        boolean[] keep = new boolean[n];
        Arrays.fill(keep, true);

        while (!q.isEmpty()) {
            int u = q.poll();
            keep[u] = false;

            for (int v : adj.get(u)) {
                degree[v]--;
                if (v != 0 && keep[v] && !hasApple.get(v) && degree[v] == 1) {
                    q.offer(v);
                }
            }
        }

        int activeNodes = 0;
        for (boolean k : keep) {
            if (k) activeNodes++;
        }

        return Math.max(0, (activeNodes - 1) * 2);
    }

    // The local harness materializes boolean arrays for this parameter.
    public int minTime(int n, int[][] edges, boolean[] hasApple) {
        List<Boolean> apples = new ArrayList<>(n);
        for (boolean apple : hasApple) {
            apples.add(apple);
        }
        return minTime(n, edges, apples);
    }
}
