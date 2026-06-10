class Solution {
public:
    vector<vector<string>> findLadders(string beginWord, string endWord, vector<string>& wordList) {
        unordered_map<string, int> depth;
        unordered_set<string> wordSet(wordList.begin(), wordList.end());
        queue<string> q;
        q.push(beginWord);
        depth[beginWord] = 1;
        wordSet.erase(beginWord);
        while (!q.empty()) {
            string word = q.front();
            q.pop();
            int steps = depth[word];
            if (word == endWord) break;
            for (int i = 0; i < static_cast<int>(word.size()); ++i) {
                char original = word[i];
                for (char ch = 'a'; ch <= 'z'; ++ch) {
                    word[i] = ch;
                    if (wordSet.erase(word)) { q.push(word); depth[word] = steps + 1; }
                }
                word[i] = original;
            }
        }
        vector<vector<string>> result;
        if (!depth.count(endWord)) return result;
        vector<string> path{endWord};
        function<void(const string&)> dfs = [&](const string& word) {
            if (word == beginWord) {
                result.emplace_back(path.rbegin(), path.rend());
                return;
            }
            int steps = depth[word];
            string current = word;
            for (int i = 0; i < static_cast<int>(current.size()); ++i) {
                char original = current[i];
                for (char ch = 'a'; ch <= 'z'; ++ch) {
                    current[i] = ch;
                    auto it = depth.find(current);
                    if (it != depth.end() && it->second + 1 == steps) {
                        path.push_back(current);
                        dfs(current);
                        path.pop_back();
                    }
                }
                current[i] = original;
            }
        };
        dfs(endWord);
        return result;
    }
};
