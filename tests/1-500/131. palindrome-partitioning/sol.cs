public class Solution {
    public IList<IList<string>> Partition(string s) {
        var result = new List<IList<string>>();
        var path = new List<string>();
        void Backtrack(int index) {
            if (index == s.Length) { result.Add(new List<string>(path)); return; }
            for (int end = index; end < s.Length; end++) {
                if (IsPalindrome(index, end)) {
                    path.Add(s.Substring(index, end - index + 1));
                    Backtrack(end + 1);
                    path.RemoveAt(path.Count - 1);
                }
            }
        }
        bool IsPalindrome(int left, int right) {
            while (left < right) if (s[left++] != s[right--]) return false;
            return true;
        }
        Backtrack(0);
        return result;
    }
}
