class Solution {
public:
    int countConsistentStrings(string allowed, vector<string>& words) {
        int result = 0;
        unordered_set<char> allowedSet(allowed.begin(), allowed.end());
        for (const string& word : words) {
            bool allIn = true;
            for (char c : word) {
                if (allowedSet.find(c) == allowedSet.end()) {
                    allIn = false;
                    break;
                }
            }
            if (allIn) result++;
        }
        return result;
    }
};
