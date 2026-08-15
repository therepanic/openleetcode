public class Solution {
    public int[] FindingUsersActiveMinutes(int[][] logs, int k) {
        var mp = new Dictionary<int, HashSet<int>>();
        foreach (var log in logs) {
            if (!mp.ContainsKey(log[0])) {
                mp[log[0]] = new HashSet<int>();
            }
            mp[log[0]].Add(log[1]);
        }
        var ans = new int[k];
        foreach (var set in mp.Values) {
            int size = set.Count;
            if (size <= k) {
                ans[size - 1]++;
            }
        }
        return ans;
    }
}
