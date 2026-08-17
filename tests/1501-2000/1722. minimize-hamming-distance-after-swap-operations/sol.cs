public class Solution {
    public int MinimumHammingDistance(int[] source, int[] target, int[][] allowedSwaps) {
        int n = source.Length;
        int[] parent = new int[n];
        for (int i = 0; i < n; i++) parent[i] = i;
        
        int Find(int x) {
            if (parent[x] != x) {
                parent[x] = Find(parent[x]);
            }
            return parent[x];
        }
        
        void Unite(int a, int b) {
            parent[Find(a)] = Find(b);
        }
        
        foreach (var swap in allowedSwaps) {
            Unite(swap[0], swap[1]);
        }
        
        var groups = new Dictionary<int, List<int>>();
        for (int i = 0; i < n; i++) {
            int root = Find(i);
            if (!groups.ContainsKey(root)) groups[root] = new List<int>();
            groups[root].Add(source[i]);
        }
        var freqMap = new Dictionary<int, Dictionary<int, int>>();
        foreach (var kvp in groups) {
            var freq = new Dictionary<int, int>();
            foreach (var v in kvp.Value) {
                freq[v] = freq.GetValueOrDefault(v) + 1;
            }
            freqMap[kvp.Key] = freq;
        }
        
        int hammingDist = 0;
        for (int i = 0; i < n; i++) {
            int root = Find(i);
            var freq = freqMap[root];
            int val = target[i];
            if (freq.GetValueOrDefault(val) > 0) {
                freq[val]--;
            } else {
                hammingDist++;
            }
        }
        return hammingDist;
    }
}
