class Solution {
public:
    vector<int> relativeSortArray(vector<int>& arr1, vector<int>& arr2) {
        int freq[1001] = {0};
        for (int num : arr1) {
            freq[num]++;
        }
        int idx = 0;
        for (int num : arr2) {
            while (freq[num] > 0) {
                arr1[idx++] = num;
                freq[num]--;
            }
        }
        for (int num = 0; num < 1001; num++) {
            while (freq[num] > 0) {
                arr1[idx++] = num;
                freq[num]--;
            }
        }
        return arr1;
    }
};
