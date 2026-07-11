class Solution {
public:
    vector<string> commonChars(vector<string>& words) {
        unordered_map<char, int> freq;
        for (char c : words[0]) {
            freq[c]++;
        }
        for (int i = 1; i < words.size(); i++) {
            unordered_map<char, int> f;
            for (char c : words[i]) {
                f[c]++;
            }
            for (auto& [c, count] : freq) {
                if (f.count(c)) {
                    freq[c] = min(f[c], count);
                } else {
                    freq[c] = 0;
                }
            }
        }
        vector<string> res;
        for (auto& [c, count] : freq) {
            for (int j = 0; j < count; j++) {
                res.push_back(string(1, c));
            }
        }
        return res;
    }
};
