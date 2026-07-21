class Solution {
public:
    int findTheDistanceValue(vector<int>& arr1, vector<int>& arr2, int d) {
        sort(arr2.begin(), arr2.end());
        int count = 0;
        for (int num : arr1) {
            auto left = lower_bound(arr2.begin(), arr2.end(), num - d);
            auto right = upper_bound(arr2.begin(), arr2.end(), num + d);
            if (left == right) {
                count++;
            }
        }
        return count;
    }
};
