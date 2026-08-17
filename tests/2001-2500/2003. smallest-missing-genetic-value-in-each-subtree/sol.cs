public class Solution {
    private bool[] seen;
    private int[] nums;
    private List<int>[] graph;
    
    public int[] SmallestMissingValueSubtree(int[] parents, int[] nums) {
        int n = parents.Length;
        graph = new List<int>[n];
        for (int i = 0; i < n; i++) graph[i] = new List<int>();
        this.nums = nums;
        
        int nodeOne = -1;
        int root = -1;
        for (int child = 0; child < n; child++) {
            if (parents[child] == -1) {
                root = child;
            } else {
                graph[parents[child]].Add(child);
            }
            if (nums[child] == 1) nodeOne = child;
        }
        
        int[] results = new int[n];
        Array.Fill(results, 1);
        if (nodeOne == -1) return results;
        
        seen = new bool[100002];
        int current = nodeOne;
        int missing = 1;
        
        while (current != -1) {
            MarkSeen(current);
            while (missing < 100002 && seen[missing]) missing++;
            results[current] = missing;
            current = parents[current];
        }
        
        return results;
    }
    
    private void MarkSeen(int node) {
        if (!seen[nums[node]]) {
            seen[nums[node]] = true;
            foreach (int child in graph[node]) {
                MarkSeen(child);
            }
        }
    }
}
