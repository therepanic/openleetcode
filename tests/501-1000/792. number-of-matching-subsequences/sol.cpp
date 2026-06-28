class Solution {
public:
    int numMatchingSubseq(string s, vector<string>& words) {
        int n = s.size();
        unordered_map<char, vector<int>> mp;
        for (int i = 0; i < n; i++) {
            mp[s[i]].push_back(i);
        }
        for (char c = 'a'; c <= 'z'; c++) {
            mp[c].push_back(n);
            sort(mp[c].begin(), mp[c].end());
        }
        
        auto found = [&](const string& word) -> bool {
            int curr = -1;
            for (char c : word) {
                if (curr >= n) return false;
                vector<int>& arr = mp[c];
                int idx = lower_bound(arr.begin(), arr.end(), curr + 1) - arr.begin();
                curr = arr[idx];
            }
            return curr < n;
        };
        
        int cnt = 0;
        for (const string& word : words) {
            if (found(word)) cnt++;
        }
        return cnt;
    }
};
