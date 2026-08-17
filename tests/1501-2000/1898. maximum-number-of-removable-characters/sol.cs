public class Solution {
    public int MaximumRemovals(string s, string p, int[] removable) {
        int left = 0, right = removable.Length;
        int max_k = 0;
        while (left <= right) {
            int mid = (left + right) / 2;
            bool[] removed = new bool[s.Length];
            for (int i = 0; i < mid; ++i) {
                removed[removable[i]] = true;
            }
            int j = 0;
            for (int i = 0; i < s.Length && j < p.Length; ++i) {
                if (!removed[i] && s[i] == p[j]) {
                    ++j;
                }
            }
            if (j == p.Length) {
                max_k = mid;
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return max_k;
    }
}
