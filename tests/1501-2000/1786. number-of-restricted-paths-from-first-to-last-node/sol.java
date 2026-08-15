class Solution {
    @SuppressWarnings("unchecked")
    public int countRestrictedPaths(int n, int[][] edges) {
        final int mod = 1_000_000_007;
        List<int[]>[] graph = new ArrayList[n + 1];
        for (int i = 0; i <= n; i++) graph[i] = new ArrayList<>();
        for (int[] e : edges) {
            graph[e[0]].add(new int[]{e[1], e[2]});
            graph[e[1]].add(new int[]{e[0], e[2]});
        }

        int[] dist = new int[n + 1];
        Arrays.fill(dist, Integer.MAX_VALUE);
        dist[n] = 0;
        PriorityQueue<int[]> pq = new PriorityQueue<>((a, b) -> Integer.compare(a[0], b[0]));
        pq.offer(new int[]{0, n});
        while (!pq.isEmpty()) {
            int[] cur = pq.poll();
            int d = cur[0], node = cur[1];
            if (d > dist[node]) continue;
            for (int[] nb : graph[node]) {
                int next = nb[0], w = nb[1];
                int nd = d + w;
                if (nd < dist[next]) {
                    dist[next] = nd;
                    pq.offer(new int[]{nd, next});
                }
            }
        }

        long[] dp = new long[n + 1];
        dp[n] = 1;
        Integer[] order = new Integer[n];
        for (int i = 0; i < n; i++) order[i] = i + 1;
        Arrays.sort(order, (a, b) -> Integer.compare(dist[a], dist[b]));
        for (int u : order) {
            for (int[] edge : graph[u]) {
                if (dist[u] > dist[edge[0]]) {
                    dp[u] = (dp[u] + dp[edge[0]]) % mod;
                }
            }
        }
        return (int) dp[1];
    }
}
