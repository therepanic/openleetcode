class Solution {
    public int[] shortestAlternatingPaths(int n, int[][] redEdges, int[][] blueEdges) {
        int[] ans = new int[n];
        Arrays.fill(ans, -1);
        
        List<List<int[]>> graph = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            graph.add(new ArrayList<>());
        }
        
        for (int[] edge : redEdges) {
            graph.get(edge[0]).add(new int[]{edge[1], 1}); // 1-red
        }
        for (int[] edge : blueEdges) {
            graph.get(edge[0]).add(new int[]{edge[1], 2}); // 2-blue
        }
        
        Queue<int[]> q = new LinkedList<>();
        q.offer(new int[]{0, 0}); // {node, prevColor}
        
        int step = 0;
        while (!q.isEmpty()) {
            int size = q.size();
            for (int i = 0; i < size; i++) {
                int[] cur = q.poll();
                int u = cur[0], prevColor = cur[1];
                if (ans[u] == -1) {
                    ans[u] = step;
                }
                List<int[]> neighbors = graph.get(u);
                for (int j = 0; j < neighbors.size(); j++) {
                    int[] pair = neighbors.get(j);
                    int v = pair[0], edgeColor = pair[1];
                    if (v == -1 || edgeColor == prevColor) continue;
                    q.offer(new int[]{v, edgeColor});
                    neighbors.set(j, new int[]{-1, edgeColor});
                }
            }
            step++;
        }
        return ans;
    }
}
