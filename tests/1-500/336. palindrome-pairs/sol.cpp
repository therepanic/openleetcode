class Solution {
private:
    bool isPalindrome(const string& s) {
        int l = 0, r = s.size() - 1;
        while (l < r) {
            if (s[l] != s[r]) return false;
            l++;
            r--;
        }
        return true;
    }

public:
    vector<vector<int>> palindromePairs(vector<string>& words) {
        vector<vector<int>> ans;
        unordered_map<string, int> wordMap;
        for (int i = 0; i < words.size(); i++) {
            string reversed = words[i];
            reverse(reversed.begin(), reversed.end());
            wordMap[reversed] = i;
        }

        if (wordMap.find("") != wordMap.end()) {
            int emptyIdx = wordMap[""];
            for (int i = 0; i < words.size(); i++) {
                if (words[i] != "" && isPalindrome(words[i])) {
                    ans.push_back({i, emptyIdx});
                }
            }
        }

        for (int i = 0; i < words.size(); i++) {
            const string& word = words[i];
            for (int j = 0; j < word.size(); j++) {
                string left = word.substr(0, j + 1);
                string right = word.substr(j + 1);
                if (wordMap.find(left) != wordMap.end() && isPalindrome(right) && wordMap[left] != i) {
                    ans.push_back({i, wordMap[left]});
                }
                if (wordMap.find(right) != wordMap.end() && isPalindrome(left) && wordMap[right] != i) {
                    ans.push_back({wordMap[right], i});
                }
            }
        }
        return ans;
    }
};
