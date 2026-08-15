import java.util.*;

class Solution {
    public int countPaths(int n, int[][] roads) {
        List<List<int[]>> graph = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            graph.add(new ArrayList<>());
        }
        for (int[] road : roads) {
            graph.get(road[0]).add(new int[]{road[1], road[2]});
            graph.get(road[1]).add(new int[]{road[0], road[2]});
        }
        
        long[] dist = new long[n];
        int[] ways = new int[n];
        Arrays.fill(dist, Long.MAX_VALUE);
        dist[0] = 0;
        ways[0] = 1;
        
        PriorityQueue<long[]> pq = new PriorityQueue<>((a, b) -> Long.compare(a[0], b[0]));
        pq.offer(new long[]{0, 0});
        
        int MOD = 1_000_000_007;
        
        while (!pq.isEmpty()) {
            long[] curr = pq.poll();
            long d = curr[0];
            int node = (int) curr[1];
            
            if (d > dist[node]) continue;
            
            for (int[] edge : graph.get(node)) {
                int neighbor = edge[0];
                int time = edge[1];
                
                if (dist[node] + time < dist[neighbor]) {
                    dist[neighbor] = dist[node] + time;
                    ways[neighbor] = ways[node];
                    pq.offer(new long[]{dist[neighbor], neighbor});
                } else if (dist[node] + time == dist[neighbor]) {
                    ways[neighbor] = (ways[neighbor] + ways[node]) % MOD;
                }
            }
        }
        
        return ways[n-1];
    }
}
