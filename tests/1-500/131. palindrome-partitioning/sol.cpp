class Solution {
public:
    vector<vector<string>> partition(string s) {
        vector<vector<string>> result;
        vector<string> path;
        backtrack(s, 0, path, result);
        return result;
    }
    void backtrack(const string& s, int index, vector<string>& path, vector<vector<string>>& result) {
        if (index == static_cast<int>(s.size())) { result.push_back(path); return; }
        for (int end = index; end < static_cast<int>(s.size()); ++end) {
            if (isPalindrome(s, index, end)) {
                path.push_back(s.substr(index, end - index + 1));
                backtrack(s, end + 1, path, result);
                path.pop_back();
            }
        }
    }
    bool isPalindrome(const string& s, int left, int right) {
        while (left < right) if (s[left++] != s[right--]) return false;
        return true;
    }
};
