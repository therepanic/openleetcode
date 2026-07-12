public class Solution {
    public IList<IList<int>> LargeGroupPositions(string s) {
        IList<IList<int>> intervals = new List<IList<int>>();
        int left = 0;
        while (left < s.Length) {
            int start = left;
            while (left + 1 < s.Length && s[left + 1] == s[left]) {
                left++;
            }
            if (left - start >= 2) {
                intervals.Add(new List<int> { start, left });
            }
            left++;
        }
        return intervals;
    }
}
