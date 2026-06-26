public class Solution {
    public string[] FindRestaurant(string[] list1, string[] list2) {
        Dictionary<string, int> mp = new Dictionary<string, int>();
        mp[list1[0]] = int.MinValue;
        for (int i = 1; i < list1.Length; i++) {
            mp[list1[i]] = -i;
        }
        if (!mp.ContainsKey(list2[0])) {
            mp[list2[0]] = int.MinValue;
        } else {
            if (mp[list2[0]] != int.MinValue) {
                mp[list2[0]] = Math.Abs(mp[list2[0]]);
            } else {
                mp[list2[0]] = 0;
            }
        }
        for (int i = 1; i < list2.Length; i++) {
            if (mp.ContainsKey(list2[i])) {
                if (mp[list2[i]] != int.MinValue) {
                    mp[list2[i]] = Math.Abs(mp[list2[i]]) + i;
                } else {
                    mp[list2[i]] = i;
                }
            } else {
                mp[list2[i]] = -i;
            }
        }
        int minVal = int.MaxValue;
        foreach (int val in mp.Values) {
            if (val >= 0) {
                minVal = Math.Min(minVal, val);
            }
        }
        List<string> ans = new List<string>();
        foreach (var kvp in mp) {
            if (kvp.Value >= 0 && kvp.Value == minVal) {
                ans.Add(kvp.Key);
            }
        }
        return ans.ToArray();
    }
}
