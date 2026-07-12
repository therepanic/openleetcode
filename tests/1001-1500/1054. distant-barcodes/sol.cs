public class Solution {
    public int[] RearrangeBarcodes(int[] barcodes) {
        Dictionary<int, int> h = new Dictionary<int, int>();
        foreach (int i in barcodes) {
            if (h.ContainsKey(i)) h[i]++;
            else h[i] = 1;
        }
        var heap = new List<(int cnt, int val)>();
        foreach (var kv in h) {
            heap.Add((kv.Value, kv.Key));
        }
        heap.Sort((a, b) => b.cnt.CompareTo(a.cnt));
        List<int> l = new List<int>();
        while (heap.Count > 1) {
            var x = heap[0]; heap.RemoveAt(0);
            var y = heap[0]; heap.RemoveAt(0);
            l.Add(x.val);
            l.Add(y.val);
            if (--x.cnt > 0) {
                heap.Add(x);
                heap.Sort((a, b) => b.cnt.CompareTo(a.cnt));
            }
            if (--y.cnt > 0) {
                heap.Add(y);
                heap.Sort((a, b) => b.cnt.CompareTo(a.cnt));
            }
        }
        if (heap.Count > 0) {
            l.Add(heap[0].val);
        }
        return l.ToArray();
    }
}
