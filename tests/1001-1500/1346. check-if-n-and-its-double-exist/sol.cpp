class Solution {
public:
    bool checkIfExist(vector<int>& arr) {
        int zeroCount = 0;
        for (int num : arr) {
            if (num == 0) zeroCount++;
        }
        if (zeroCount >= 2) return true;

        for (int i : arr) {
            if (i != 0) {
                for (int j : arr) {
                    if (j == i * 2) return true;
                }
            }
        }
        return false;
    }
};
