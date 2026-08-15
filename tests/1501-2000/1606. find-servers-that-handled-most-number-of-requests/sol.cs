public class Solution {
    public IList<int> BusiestServers(int k, int[] arrival, int[] load) {
        var available = new SortedSet<int>();
        for (int i = 0; i < k; i++) available.Add(i);
        var busy = new SortedSet<(int end, int server)>();
        var res = new int[k];
        for (int i = 0; i < arrival.Length; i++) {
            int a = arrival[i];
            while (busy.Count > 0 && busy.Min.end <= a) {
                var item = busy.Min;
                busy.Remove(item);
                int x = item.server;
                int encoded = i + ((x - i) % k + k) % k;
                available.Add(encoded);
            }
            if (available.Count > 0) {
                int encoded = available.Min;
                available.Remove(encoded);
                int j = encoded % k;
                busy.Add((a + load[i], j));
                res[j]++;
            }
        }
        int mx = res.Max();
        var ans = new List<int>();
        for (int i = 0; i < k; i++) if (res[i] == mx) ans.Add(i);
        return ans;
    }
}
