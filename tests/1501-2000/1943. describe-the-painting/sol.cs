public class Solution {
    public IList<IList<long>> SplitPainting(int[][] segments) {
        var events = new List<(int pos, int val)>();
        foreach (var seg in segments) {
            events.Add((seg[0], seg[2]));
            events.Add((seg[1], -seg[2]));
        }
        events.Sort((a, b) => a.pos.CompareTo(b.pos));
        
        var ans = new List<IList<long>>();
        int prev = -1;
        long mix = 0;
        foreach (var e in events) {
            if (prev != -1) {
                if (e.pos != prev && mix != 0) {
                    ans.Add(new List<long> { prev, e.pos, mix });
                }
            }
            prev = e.pos;
            mix += e.val;
        }
        return ans;
    }
}
