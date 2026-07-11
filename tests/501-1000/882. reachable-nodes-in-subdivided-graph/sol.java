class Solution {
    public int reachableNodes(int[][] edges, int maxMoves, int n) {
        List<List<int[]>> graph = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            graph.add(new ArrayList<>());
        }
        int[] dist = new int[n];
        Arrays.fill(dist, Integer.MAX_VALUE / 2);
        
        for (int[] edge : edges) {
            int u = edge[0], v = edge[1], cnt = edge[2];
            graph.get(u).add(new int[]{v, cnt});
            graph.get(v).add(new int[]{u, cnt});
        }
        
        int reachableNodes = dijkstra(graph, 0, maxMoves, dist);
        int reachableSubnodes = 0;
        
        for (int[] edge : edges) {
            int u = edge[0], v = edge[1], cnt = edge[2];
            int a = dist[u] > maxMoves ? 0 : Math.min(maxMoves - dist[u], cnt);
            int b = dist[v] > maxMoves ? 0 : Math.min(maxMoves - dist[v], cnt);
            reachableSubnodes += Math.min(a + b, cnt);
        }
        
        return reachableNodes + reachableSubnodes;
    }
    
    private int dijkstra(List<List<int[]>> graph, int src, int maxMoves, int[] dist) {
        dist[src] = 0;
        ArrayDeque<Integer> queue = new ArrayDeque<>();
        boolean[] inQueue = new boolean[dist.length];
        queue.add(src);
        inQueue[src] = true;
        
        while (!queue.isEmpty()) {
            int u = queue.poll();
            inQueue[u] = false;
            int d = dist[u];
            
            if (d > dist[u] || d > maxMoves) {
                continue;
            }
            
            for (int[] neighbor : graph.get(u)) {
                int v = neighbor[0], w = neighbor[1];
                int newDist = d + w + 1;
                if (newDist < dist[v]) {
                    dist[v] = newDist;
                    if (!inQueue[v]) {
                        queue.add(v);
                        inQueue[v] = true;
                    }
                }
            }
        }
        
        int count = 0;
        for (int d : dist) {
            if (d <= maxMoves) count++;
        }
        return count;
    }
}
