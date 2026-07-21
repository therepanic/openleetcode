public class Solution {
    public bool UniqueOccurrences(int[] arr) {
        var d = new Dictionary<int, int>();
        foreach (int i in arr) {
            if (d.ContainsKey(i)) {
                d[i]++;
            } else {
                d[i] = 1;
            }
        }
        var s = new HashSet<int>();
        foreach (int value in d.Values) {
            if (s.Contains(value)) {
                return false;
            }
            s.Add(value);
        }
        return true;
    }
}
