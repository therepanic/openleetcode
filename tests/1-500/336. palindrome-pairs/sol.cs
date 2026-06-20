public class Solution {
    private bool IsPalindrome(string s) {
        int l = 0, r = s.Length - 1;
        while (l < r) {
            if (s[l] != s[r]) return false;
            l++;
            r--;
        }
        return true;
    }

    public IList<IList<int>> PalindromePairs(string[] words) {
        var ans = new List<IList<int>>();
        var wordMap = new Dictionary<string, int>();
        for (int i = 0; i < words.Length; i++) {
            char[] charArray = words[i].ToCharArray();
            Array.Reverse(charArray);
            wordMap[new string(charArray)] = i;
        }

        if (wordMap.ContainsKey("")) {
            int emptyIdx = wordMap[""];
            for (int i = 0; i < words.Length; i++) {
                if (words[i] != "" && IsPalindrome(words[i])) {
                    ans.Add(new List<int> { i, emptyIdx });
                }
            }
        }

        for (int i = 0; i < words.Length; i++) {
            string word = words[i];
            for (int j = 0; j < word.Length; j++) {
                string left = word.Substring(0, j + 1);
                string right = word.Substring(j + 1);
                if (wordMap.ContainsKey(left) && IsPalindrome(right) && wordMap[left] != i) {
                    ans.Add(new List<int> { i, wordMap[left] });
                }
                if (wordMap.ContainsKey(right) && IsPalindrome(left) && wordMap[right] != i) {
                    ans.Add(new List<int> { wordMap[right], i });
                }
            }
        }
        return ans;
    }
}
