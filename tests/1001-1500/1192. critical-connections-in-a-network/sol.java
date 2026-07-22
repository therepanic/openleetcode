class Solution {
    public List<List<Integer>> criticalConnections(int n, int[][] connections) {
        List<List<Integer>> graph = new ArrayList<>(n);
        for (int i = 0; i < n; i++) {
            graph.add(new ArrayList<>());
        }
        for (int[] edge : connections) {
            int u = edge[0];
            int v = edge[1];
            graph.get(u).add(v);
            graph.get(v).add(u);
        }
        
        int[] disc = new int[n];
        int[] low = new int[n];
        Arrays.fill(disc, -1);
        int[] timer = new int[]{0};
        List<List<Integer>> bridges = new ArrayList<>();
        
        int[] iterIdx = new int[n];
        
        for (int start = 0; start < n; start++) {
            if (disc[start] != -1) continue;
            
            Deque<int[]> stack = new ArrayDeque<>();
            disc[start] = low[start] = timer[0];
            timer[0]++;
            stack.push(new int[]{start, -1});
            
            while (!stack.isEmpty()) {
                int[] top = stack.peek();
                int node = top[0];
                int parent = top[1];
                List<Integer> neighbors = graph.get(node);
                int idx = iterIdx[node];
                
                if (idx < neighbors.size()) {
                    int nb = neighbors.get(idx);
                    iterIdx[node]++;
                    if (nb == parent) continue;
                    
                    if (disc[nb] == -1) {
                        disc[nb] = low[nb] = timer[0];
                        timer[0]++;
                        stack.push(new int[]{nb, node});
                    } else {
                        low[node] = Math.min(low[node], disc[nb]);
                    }
                } else {
                    stack.pop();
                    if (!stack.isEmpty()) {
                        int par = stack.peek()[0];
                        low[par] = Math.min(low[par], low[node]);
                        if (low[node] > disc[par]) {
                            bridges.add(Arrays.asList(par, node));
                        }
                    }
                }
            }
        }
        
        return bridges;
    }
}
