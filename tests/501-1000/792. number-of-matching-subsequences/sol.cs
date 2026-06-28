public class Solution {
    public int NumMatchingSubseq(string s, string[] words) {
        int n = s.Length;
        Dictionary<char, List<int>> mp = new Dictionary<char, List<int>>();
        for (int i = 0; i < n; i++) {
            char c = s[i];
            if (!mp.ContainsKey(c)) mp[c] = new List<int>();
            mp[c].Add(i);
        }
        for (char c = 'a'; c <= 'z'; c++) {
            if (!mp.ContainsKey(c)) mp[c] = new List<int>();
            mp[c].Add(n);
            mp[c].Sort();
        }
        
        bool Found(string word) {
            int curr = -1;
            foreach (char c in word) {
                if (curr >= n) return false;
                List<int> arr = mp[c];
                int idx = arr.BinarySearch(curr + 1);
                if (idx < 0) idx = ~idx;
                curr = arr[idx];
            }
            return curr < n;
        }
        
        int cnt = 0;
        foreach (string word in words) {
            if (Found(word)) cnt++;
        }
        return cnt;
    }
}
