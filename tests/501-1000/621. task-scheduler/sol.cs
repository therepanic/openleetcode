public class Solution {
    public int LeastInterval(char[] tasks, int n) {
        var count = new Dictionary<char, int>();
        foreach (char t in tasks) {
            if (count.ContainsKey(t)) count[t]++;
            else count[t] = 1;
        }
        int f_max = 0;
        foreach (var v in count.Values) {
            f_max = Math.Max(f_max, v);
        }
        int max_count = 0;
        foreach (var v in count.Values) {
            if (v == f_max) max_count++;
        }
        return Math.Max(tasks.Length, (f_max - 1) * (n + 1) + max_count);
    }
}
