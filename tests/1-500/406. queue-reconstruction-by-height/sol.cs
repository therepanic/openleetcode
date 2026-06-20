public class Solution {
    public int[][] ReconstructQueue(int[][] people) {
        System.Array.Sort(people, (a, b) => a[0] != b[0] ? b[0] - a[0] : a[1] - b[1]);
        var q = new System.Collections.Generic.List<int[]>();
        foreach (var p in people) {
            q.Insert(p[1], p);
        }
        return q.ToArray();
    }
}
