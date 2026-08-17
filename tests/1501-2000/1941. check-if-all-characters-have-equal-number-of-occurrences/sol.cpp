class Solution {
public:
    bool areOccurrencesEqual(string s) {
        unordered_map<char, int> freq;
        for (char c : s) {
            freq[c]++;
        }
        unordered_set<int> vals;
        for (auto& [k, v] : freq) {
            vals.insert(v);
        }
        return vals.size() == 1;
    }
};
