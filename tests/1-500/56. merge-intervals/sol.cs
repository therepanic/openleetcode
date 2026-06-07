public class Solution {
    public int[][] Merge(int[][] intervals) {
        Array.Sort(intervals, (a, b) => a[0].CompareTo(b[0]));
        var merged = new List<int[]>();

        foreach (var interval in intervals) {
            if (merged.Count == 0 || merged[merged.Count - 1][1] < interval[0]) {
                merged.Add(interval);
            } else {
                merged[merged.Count - 1][1] = Math.Max(merged[merged.Count - 1][1], interval[1]);
            }
        }

        return merged.ToArray();
    }
}
