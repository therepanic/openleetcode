class Solution {
public:
    vector<int> findSubstring(string s, vector<string>& words) {
        vector<int> ans;
        if (s.empty() || words.empty()) return ans;

        int wordLen = (int)words[0].size();
        int wordCount = (int)words.size();
        unordered_map<string, int> target;
        for (const string& word : words) target[word]++;

        for (int offset = 0; offset < wordLen; ++offset) {
            int left = offset;
            int right = offset;
            int used = 0;
            unordered_map<string, int> window;

            while (right + wordLen <= (int)s.size()) {
                string word = s.substr(right, wordLen);
                right += wordLen;

                if (target.count(word)) {
                    window[word]++;
                    used++;
                    while (window[word] > target[word]) {
                        string leftWord = s.substr(left, wordLen);
                        window[leftWord]--;
                        left += wordLen;
                        used--;
                    }
                    if (used == wordCount) {
                        ans.push_back(left);
                        string leftWord = s.substr(left, wordLen);
                        window[leftWord]--;
                        left += wordLen;
                        used--;
                    }
                } else {
                    window.clear();
                    used = 0;
                    left = right;
                }
            }
        }
        return ans;
    }
};
