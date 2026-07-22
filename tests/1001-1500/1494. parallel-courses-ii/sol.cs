public class Solution {
    private int n;
    private int k;
    private List<int>[] graph;
    private Dictionary<string, int> memo;
    
    public int MinNumberOfSemesters(int n, int[][] relations, int k) {
        this.n = n;
        this.k = k;
        graph = new List<int>[n];
        for (int i = 0; i < n; i++) {
            graph[i] = new List<int>();
        }
        int[] inDegrees = new int[n];
        foreach (var rel in relations) {
            int prev = rel[0] - 1;
            int next = rel[1] - 1;
            inDegrees[next]++;
            graph[prev].Add(next);
        }
        memo = new Dictionary<string, int>();
        return Recurse((1 << n) - 1, inDegrees);
    }
    
    private int Recurse(int mask, int[] inDegrees) {
        if (mask == 0) return 0;
        string key = mask + string.Join(",", inDegrees);
        if (memo.ContainsKey(key)) return memo[key];
        
        List<int> nodes = new List<int>();
        for (int i = 0; i < n; i++) {
            if ((mask & (1 << i)) != 0 && inDegrees[i] == 0) {
                nodes.Add(i);
            }
        }
        int ans = int.MaxValue;
        int combLimit = Math.Min(k, nodes.Count);
        var combos = GetCombinations(nodes, combLimit);
        foreach (var kNodes in combos) {
            int newMask = mask;
            int[] newInDeg = (int[])inDegrees.Clone();
            foreach (int node in kNodes) {
                newMask ^= (1 << node);
                foreach (int child in graph[node]) {
                    newInDeg[child]--;
                }
            }
            ans = Math.Min(ans, 1 + Recurse(newMask, newInDeg));
        }
        memo[key] = ans;
        return ans;
    }
    
    private List<List<int>> GetCombinations(List<int> arr, int k) {
        var result = new List<List<int>>();
        Backtrack(arr, k, 0, new List<int>(), result);
        return result;
    }
    
    private void Backtrack(List<int> arr, int k, int start, List<int> current, List<List<int>> result) {
        if (current.Count == k) {
            result.Add(new List<int>(current));
            return;
        }
        for (int i = start; i < arr.Count; i++) {
            current.Add(arr[i]);
            Backtrack(arr, k, i + 1, current, result);
            current.RemoveAt(current.Count - 1);
        }
    }
}
