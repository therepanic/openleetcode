class Solution {
public:
    int getXORSum(vector<int>& arr1, vector<int>& arr2) {
        int x = 0, y = 0;
        for (int v : arr1) {
            x ^= v;
        }
        for (int v : arr2) {
            y ^= v;
        }
        return x & y;
    }
};
