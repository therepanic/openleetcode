public class Solution {
    public int[] AvoidFlood(int[] rains) {
        int n = rains.Length;
        int[] res = new int[n];
        Array.Fill(res, -1);
        var full = new Dictionary<int, int>();
        var dry = new SortedSet<int>();
        for (int i = 0; i < n; i++) {
            int lake = rains[i];
            if (lake == 0) {
                dry.Add(i);
                res[i] = 1;
            } else if (full.ContainsKey(lake)) {
                var view = dry.GetViewBetween(full[lake] + 1, int.MaxValue);
                if (view.Count == 0) return new int[0];
                int j = view.Min;
                res[j] = lake;
                dry.Remove(j);
                full[lake] = i;
            } else {
                full[lake] = i;
            }
        }
        return res;
    }
}
