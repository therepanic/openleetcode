class Solution {
    public List<List<Integer>> allPathsSourceTarget(int[][] graph) {
        List<List<Integer>> result = new ArrayList<>();
        int target = graph.length - 1;
        
        Queue<Pair<Integer, List<Integer>>> queue = new LinkedList<>();
        List<Integer> startPath = new ArrayList<>();
        startPath.add(0);
        queue.add(new Pair<>(0, startPath));
        
        while (!queue.isEmpty()) {
            Pair<Integer, List<Integer>> pair = queue.poll();
            int node = pair.getKey();
            List<Integer> path = pair.getValue();
            
            if (node == target) {
                result.add(new ArrayList<>(path));
                continue;
            }
            
            for (int neighbor : graph[node]) {
                List<Integer> newPath = new ArrayList<>(path);
                newPath.add(neighbor);
                queue.add(new Pair<>(neighbor, newPath));
            }
        }
        
        return result;
    }
}
