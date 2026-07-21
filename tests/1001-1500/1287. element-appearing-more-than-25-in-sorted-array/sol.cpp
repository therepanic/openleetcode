class Solution {
public:
    int findSpecialInteger(vector<int>& arr) {
        int n = arr.size();
        int q = n / 4;
        unordered_map<int, int> m;
        for (int num : arr) {
            m[num]++;
            if (m[num] > q) {
                return num;
            }
        }
        return -1;
    }
};
