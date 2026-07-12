class Solution {
    public int[] gardenNoAdj(int n, int[][] paths) {
        Map<Integer, List<Integer>> graph = new HashMap<>();
        
        for (int[] path : paths) {
            int u = path[0];
            int v = path[1];
            graph.computeIfAbsent(u, k -> new ArrayList<>()).add(v);
            graph.computeIfAbsent(v, k -> new ArrayList<>()).add(u);
        }
        
        for (int node = 1; node <= n; node++) {
            graph.putIfAbsent(node, new ArrayList<>());
        }
        
        int[] answer = new int[n + 1];
        
        for (int i = 1; i <= n; i++) {
            Set<Integer> used = new HashSet<>();
            for (int nei : graph.get(i)) {
                used.add(answer[nei]);
            }
            
            for (int flower = 1; flower <= 4; flower++) {
                if (!used.contains(flower)) {
                    answer[i] = flower;
                    break;
                }
            }
        }
        
        return Arrays.copyOfRange(answer, 1, n + 1);
    }
}
