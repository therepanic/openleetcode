class Solution {
    private boolean[] seen;
    private int[] nums;
    private HashMap<Integer, ArrayList<Integer>> graph;
    
    public int[] smallestMissingValueSubtree(int[] parents, int[] nums) {
        int n = parents.length;
        graph = new HashMap<>();
        for (int i = 0; i < n; i++) graph.put(i, new ArrayList<>());
        this.nums = nums;
        
        int nodeOne = -1;
        int root = -1;
        for (int child = 0; child < n; child++) {
            if (parents[child] == -1) {
                root = child;
            } else {
                graph.get(parents[child]).add(child);
            }
            if (nums[child] == 1) nodeOne = child;
        }
        
        int[] results = new int[n];
        Arrays.fill(results, 1);
        if (nodeOne == -1) return results;
        
        seen = new boolean[100002];
        int current = nodeOne;
        int missing = 1;
        
        while (current != -1) {
            markSeen(current);
            while (missing < 100002 && seen[missing]) missing++;
            results[current] = missing;
            current = parents[current];
        }
        
        return results;
    }
    
    private void markSeen(int node) {
        if (!seen[nums[node]]) {
            seen[nums[node]] = true;
            for (int child : graph.get(node)) markSeen(child);
        }
    }
}
