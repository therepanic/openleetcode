class Solution {
    public int networkDelayTime(int[][] times, int n, int k) {
        List<List<int[]>> adj = new ArrayList<>();
        for (int i = 0; i <= n; i++) {
            adj.add(new ArrayList<>());
        }
        for (int[] t : times) {
            adj.get(t[0]).add(new int[]{t[1], t[2]});
        }
        
        int[] dist = new int[n + 1];
        Arrays.fill(dist, Integer.MAX_VALUE);
        dist[k] = 0;
        
        PriorityQueue<int[]> pq = new PriorityQueue<>((a, b) -> a[0] - b[0]);
        pq.offer(new int[]{0, k});
        
        while (!pq.isEmpty()) {
            int[] cur = pq.poll();
            int dis = cur[0], node = cur[1];
            if (dis > dist[node]) continue;
            for (int[] next : adj.get(node)) {
                int adjNode = next[0], wt = next[1];
                if (dis + wt < dist[adjNode]) {
                    dist[adjNode] = dis + wt;
                    pq.offer(new int[]{dist[adjNode], adjNode});
                }
            }
        }
        
        int ans = 0;
        for (int i = 1; i <= n; i++) {
            if (dist[i] == Integer.MAX_VALUE) return -1;
            ans = Math.max(ans, dist[i]);
        }
        return ans;
    }
}
