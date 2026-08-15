class Solution {
public:
    int longestPalindrome(string word1, string word2) {
        string word = word1 + word2;
        int n = word.size();
        vector<vector<int>> memo(n, vector<int>(n, -1));
        
        function<int(int,int)> fn = [&](int lo, int hi) {
            if (lo >= hi) return lo == hi ? 1 : 0;
            if (memo[lo][hi] != -1) return memo[lo][hi];
            if (word[lo] == word[hi]) {
                memo[lo][hi] = 2 + fn(lo+1, hi-1);
            } else {
                memo[lo][hi] = max(fn(lo+1, hi), fn(lo, hi-1));
            }
            return memo[lo][hi];
        };
        
        int ans = 0;
        unordered_set<char> seen;
        for (int i = 0; i < word1.size(); i++) {
            char c = word1[i];
            if (seen.count(c)) continue;
            seen.insert(c);
            int idx1 = word1.find(c);
            int idx2 = word2.rfind(c);
            if (idx1 != string::npos && idx2 != string::npos) {
                ans = max(ans, fn(idx1, idx2 + word1.size()));
            }
        }
        return ans;
    }
};
