public class Solution {
    public IList<IList<int>> GroupThePeople(int[] groupSizes) {
        IList<IList<int>> ans = new List<IList<int>>();
        Dictionary<int, List<int>> mp = new Dictionary<int, List<int>>();
        for (int i = 0; i < groupSizes.Length; i++) {
            int v = groupSizes[i];
            if (!mp.ContainsKey(v)) mp[v] = new List<int>();
            mp[v].Add(i);
            if (mp[v].Count == v) {
                ans.Add(new List<int>(mp[v]));
                mp[v] = new List<int>();
            }
        }
        return ans;
    }
}
