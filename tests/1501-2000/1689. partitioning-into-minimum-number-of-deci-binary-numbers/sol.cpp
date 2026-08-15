class Solution {
public:
    int minPartitions(string n) {
        int maxDigit = 0;
        for (char c : n) {
            maxDigit = max(maxDigit, c - '0');
        }
        return maxDigit;
    }
};
