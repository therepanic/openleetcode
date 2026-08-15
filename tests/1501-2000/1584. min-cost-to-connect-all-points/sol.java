import java.util.PriorityQueue;
import java.util.HashMap;

class Solution {
    public int minCostConnectPoints(int[][] points) {
        int n = points.length;
        int minCost = 0;
        boolean[] visited = new boolean[n];
        PriorityQueue<int[]> pq = new PriorityQueue<>((a,b) -> a[0] - b[0]);
        pq.offer(new int[]{0, 0});
        HashMap<Integer, Integer> cache = new HashMap<>();
        cache.put(0, 0);
        
        while (!pq.isEmpty()) {
            int[] curr = pq.poll();
            int cost = curr[0], u = curr[1];
            if (visited[u]) continue;
            visited[u] = true;
            minCost += cost;
            for (int v = 0; v < n; v++) {
                if (!visited[v]) {
                    int dist = Math.abs(points[u][0] - points[v][0]) + Math.abs(points[u][1] - points[v][1]);
                    if (dist < cache.getOrDefault(v, Integer.MAX_VALUE)) {
                        cache.put(v, dist);
                        pq.offer(new int[]{dist, v});
                    }
                }
            }
        }
        return minCost;
    }
}
