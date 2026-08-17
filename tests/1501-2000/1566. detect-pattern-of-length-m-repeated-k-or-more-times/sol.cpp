class Solution {
public:
    bool containsPattern(vector<int>& arr, int m, int k) {
        for (int i = 0; i <= (int)arr.size() - m * k; i++) {
            bool match = true;
            for (int j = 0; j < m * (k - 1); j++) {
                if (arr[i + j] != arr[i + j + m]) {
                    match = false;
                    break;
                }
            }
            if (match) return true;
        }
        return false;
    }
};
