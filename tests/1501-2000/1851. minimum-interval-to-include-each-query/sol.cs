using System;
using System.Collections.Generic;
using System.Linq;

public class Solution {
    public int[] MinInterval(int[][] intervals, int[] queries) {
        Array.Sort(intervals, (a, b) => a[0] - b[0]);
        var minHeap = new SortedSet<(int, int)>();
        var res = new Dictionary<int, int>();
        int i = 0;
        var sortedQueries = queries.OrderBy(q => q).ToArray();
        foreach (var q in sortedQueries) {
            while (i < intervals.Length && intervals[i][0] <= q) {
                int l = intervals[i][0];
                int r = intervals[i][1];
                minHeap.Add((r - l + 1, r));
                i++;
            }
            while (minHeap.Count > 0 && minHeap.Min.Item2 < q) {
                minHeap.Remove(minHeap.Min);
            }
            res[q] = minHeap.Count == 0 ? -1 : minHeap.Min.Item1;
        }
        return queries.Select(q => res[q]).ToArray();
    }
}
