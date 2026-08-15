class Solution {
public:
    int numOfStrings(vector<string>& patterns, string word) {
        int count = 0;
        for (string& s : patterns) {
            if (word.find(s) != string::npos) {
                count++;
            }
        }
        return count;
    }
};
