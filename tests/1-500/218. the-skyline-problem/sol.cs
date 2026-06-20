using System.Linq;

public class Solution {
    public IList<IList<int>> GetSkyline(int[][] buildings) {
        List<(int x, int h)> events = new List<(int, int)>();
        foreach (var b in buildings) {
            int l = b[0], r = b[1], h = b[2];
            events.Add((l, -h));
            events.Add((r, h));
        }
        events.Sort((a, b) => {
            if (a.x != b.x) return a.x.CompareTo(b.x);
            return a.h.CompareTo(b.h);
        });

        IList<IList<int>> result = new List<IList<int>>();
        SortedDictionary<int, int> active = new SortedDictionary<int, int>();
        active[0] = 1;
        int prevMax = 0;

        foreach (var (x, h) in events) {
            if (h < 0) {
                int height = -h;
                if (!active.ContainsKey(height)) active[height] = 0;
                active[height]++;
            } else {
                int height = h;
                if (active.ContainsKey(height)) {
                    active[height]--;
                    if (active[height] == 0) active.Remove(height);
                }
            }

            int currMax = active.Keys.Last();
            if (currMax != prevMax) {
                result.Add(new List<int> { x, currMax });
                prevMax = currMax;
            }
        }

        return result;
    }
}
