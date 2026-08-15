public class Solution {
    public IList<int> MostVisited(int n, int[] rounds) {
        int s = rounds[0];
        int e = rounds[rounds.Length - 1];
        var ans = new List<int>();
        if (s <= e) {
            for (int i = s; i <= e; i++) ans.Add(i);
        } else {
            for (int i = 1; i <= e; i++) ans.Add(i);
            for (int i = s; i <= n; i++) ans.Add(i);
        }
        return ans;
    }
}
