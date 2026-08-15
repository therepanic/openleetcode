class Solution {
public:
    int numSplits(string s) {
        int n = s.size();
        int counter = 0;
        unordered_map<char, int> distinct_left, distinct_right;

        for (char c : s) {
            distinct_right[c]++;
        }
        for (int i = 0; i < n - 1; i++) {
            char c = s[i];
            distinct_left[c]++;
            distinct_right[c]--;
            if (distinct_right[c] == 0) {
                distinct_right.erase(c);
            }
            if (distinct_left.size() == distinct_right.size()) {
                counter++;
            }
        }

        return counter;
    }
};
