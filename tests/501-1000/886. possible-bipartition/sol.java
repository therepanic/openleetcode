class Solution {
    public boolean possibleBipartition(int n, int[][] dislikes) {
        Map<Integer, List<Integer>> graph = new HashMap<>();
        for (int[] edge : dislikes) {
            int u = edge[0], v = edge[1];
            graph.computeIfAbsent(u, k -> new ArrayList<>()).add(v);
            graph.computeIfAbsent(v, k -> new ArrayList<>()).add(u);
        }
        
        int[] color = new int[n + 1];
        
        for (int node = 1; node <= n; node++) {
            if (color[node] != 0 || !graph.containsKey(node)) {
                continue;
            }
            
            Queue<Integer> queue = new LinkedList<>();
            queue.offer(node);
            color[node] = 1;
            
            while (!queue.isEmpty()) {
                int curr = queue.poll();
                
                for (int neighbor : graph.get(curr)) {
                    if (color[neighbor] == color[curr]) {
                        return false;
                    }
                    
                    if (color[neighbor] == 0) {
                        color[neighbor] = -color[curr];
                        queue.offer(neighbor);
                    }
                }
            }
        }
        
        return true;
    }
}
