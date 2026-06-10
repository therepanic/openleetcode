class Solution {
public:
    int ladderLength(string beginWord, string endWord, vector<string>& wordList) {
        unordered_set<string> wordSet(wordList.begin(), wordList.end());
        if (!wordSet.count(endWord)) return 0;
        queue<pair<string, int>> q;
        q.push({beginWord, 1});
        while (!q.empty()) {
            auto [word, steps] = q.front();
            q.pop();
            if (word == endWord) return steps;
            for (int i = 0; i < static_cast<int>(word.size()); ++i) {
                char original = word[i];
                for (char ch = 'a'; ch <= 'z'; ++ch) {
                    word[i] = ch;
                    if (wordSet.erase(word)) q.push({word, steps + 1});
                }
                word[i] = original;
            }
        }
        return 0;
    }
};
