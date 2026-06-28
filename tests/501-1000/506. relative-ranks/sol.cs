public class Solution {
    public string[] FindRelativeRanks(int[] score) {
        int n = score.Length;
        int[] sorted = (int[])score.Clone();
        Array.Sort(sorted, (a, b) => b.CompareTo(a));
        Dictionary<int, string> ranks = new Dictionary<int, string>();
        for (int i = 0; i < n; i++) {
            ranks[sorted[i]] = (i + 1).ToString();
        }
        ranks[sorted[0]] = "Gold Medal";
        if (n > 1) ranks[sorted[1]] = "Silver Medal";
        if (n > 2) ranks[sorted[2]] = "Bronze Medal";
        string[] result = new string[n];
        for (int i = 0; i < n; i++) {
            result[i] = ranks[score[i]];
        }
        return result;
    }
}
