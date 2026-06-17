public class Solution {
    public int MaxEnvelopes(int[][] envelopes) {
        Array.Sort(envelopes, (a, b) => a[0] == b[0] ? b[1] - a[1] : a[0] - b[0]);
        var result = new List<int>();
        foreach (var e in envelopes) {
            int h = e[1];
            int idx = result.BinarySearch(h);
            if (idx < 0) idx = ~idx;
            if (idx == result.Count) {
                result.Add(h);
            } else {
                result[idx] = h;
            }
        }
        return result.Count;
    }
}
