class Solution {
public:
    int getLastMoment(int n, vector<int>& left, vector<int>& right) {
        int maxVal = 0;
        for (int value : left) {
            maxVal = max(value, maxVal);
        }
        for (int value : right) {
            maxVal = max(n - value, maxVal);
        }
        return maxVal;
    }
};
