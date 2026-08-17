public class Solution {
    public int[] GetOrder(int[][] tasks) {
        int n = tasks.Length;
        var indexed = new (int, int, int)[n];
        for (int i = 0; i < n; i++) {
            indexed[i] = (tasks[i][0], tasks[i][1], i);
        }
        Array.Sort(indexed, (a, b) => a.Item1.CompareTo(b.Item1));
        
        var result = new List<int>();
        var heap = new SortedSet<(int, int)>();
        long time = 0;
        int idx = 0;
        
        while (idx < n || heap.Count > 0) {
            if (heap.Count == 0 && time < indexed[idx].Item1) {
                time = indexed[idx].Item1;
            }
            
            while (idx < n && indexed[idx].Item1 <= time) {
                heap.Add((indexed[idx].Item2, indexed[idx].Item3));
                idx++;
            }
            
            var (process, index) = heap.Min;
            heap.Remove(heap.Min);
            result.Add(index);
            time += process;
        }
        
        return result.ToArray();
    }
}
