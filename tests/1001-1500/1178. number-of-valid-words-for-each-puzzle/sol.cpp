class Solution {
public:
    vector<int> findNumOfValidWords(vector<string>& words, vector<string>& puzzles) {
        auto getMask = [](const string& s) {
            int mask = 0;
            for (char c : s) {
                mask |= 1 << (c - 'a');
            }
            return mask;
        };
        
        unordered_map<int, int> wordCount;
        for (const string& w : words) {
            int mask = getMask(w);
            wordCount[mask]++;
        }
        
        vector<int> result;
        for (const string& p : puzzles) {
            int firstMask = 1 << (p[0] - 'a');
            int puzzleMask = getMask(p);
            int sub = puzzleMask;
            int count = 0;
            while (true) {
                if ((sub & firstMask) != 0) {
                    count += wordCount[sub];
                }
                if (sub == 0) break;
                sub = (sub - 1) & puzzleMask;
            }
            result.push_back(count);
        }
        return result;
    }
};
