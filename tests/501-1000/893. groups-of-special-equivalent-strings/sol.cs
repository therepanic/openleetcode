public class Solution {
    public int NumSpecialEquivGroups(string[] words) {
        var seen = new HashSet<string>();
        foreach (var w in words) {
            var even = new List<char>();
            var odd = new List<char>();
            for (int i = 0; i < w.Length; i++) {
                if (i % 2 == 0) even.Add(w[i]);
                else odd.Add(w[i]);
            }
            even.Sort();
            odd.Sort();
            seen.Add(new string(even.ToArray()) + "," + new string(odd.ToArray()));
        }
        return seen.Count;
    }
}
