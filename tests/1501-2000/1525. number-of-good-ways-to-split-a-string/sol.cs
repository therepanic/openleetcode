public class Solution {
    public int NumSplits(string s) {
        int n = s.Length;
        int counter = 0;
        Dictionary<char, int> distinct_left = new Dictionary<char, int>();
        Dictionary<char, int> distinct_right = new Dictionary<char, int>();

        foreach (char c in s) {
            if (distinct_right.ContainsKey(c)) {
                distinct_right[c]++;
            } else {
                distinct_right[c] = 1;
            }
        }
        for (int i = 0; i < n - 1; i++) {
            char c = s[i];
            if (distinct_left.ContainsKey(c)) {
                distinct_left[c]++;
            } else {
                distinct_left[c] = 1;
            }
            distinct_right[c]--;
            if (distinct_right[c] == 0) {
                distinct_right.Remove(c);
            }
            if (distinct_left.Count == distinct_right.Count) {
                counter++;
            }
        }

        return counter;
    }
}
