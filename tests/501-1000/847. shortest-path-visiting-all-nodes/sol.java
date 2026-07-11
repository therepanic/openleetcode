class Solution {
    public int shortestPathLength(int[][] graph) {
        int n = graph.length;
        if (n == 1) return 0;
        
        int FULL = (1 << n) - 1;
        boolean[][] visited = new boolean[n][1 << n];
        java.util.Queue<int[]> q = new java.util.LinkedList<>();
        
        for (int i = 0; i < n; i++) {
            int mask = 1 << i;
            q.offer(new int[]{i, mask, 0});
            visited[i][mask] = true;
        }
        
        while (!q.isEmpty()) {
            int[] cur = q.poll();
            int node = cur[0], mask = cur[1], dist = cur[2];
            
            if (mask == FULL) return dist;
            
            for (int nei : graph[node]) {
                int newMask = mask | (1 << nei);
                
                if (!visited[nei][newMask]) {
                    visited[nei][newMask] = true;
                    q.offer(new int[]{nei, newMask, dist + 1});
                }
            }
        }
        
        return -1;
    }
}
