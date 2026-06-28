public class Solution {
    public IList<string> TopKFrequent(string[] words, int k) {
        var counter = new Dictionary<string, int>();
        foreach (var w in words) {
            counter.TryGetValue(w, out int c);
            counter[w] = c + 1;
        }
        var heap = new List<(int, string)>();
        foreach (var kv in counter) {
            heap.Add((-kv.Value, kv.Key));
        }
        heap.Sort((a, b) => {
            int cmp = a.Item1.CompareTo(b.Item1);
            if (cmp != 0) return cmp;
            return a.Item2.CompareTo(b.Item2);
        });
        var ans = new List<string>();
        for (int i = 0; i < k; i++) {
            ans.Add(heap[i].Item2);
        }
        return ans;
    }
}
