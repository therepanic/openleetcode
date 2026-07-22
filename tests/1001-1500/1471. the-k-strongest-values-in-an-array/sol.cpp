class Solution {
public:
    vector<int> getStrongest(vector<int>& arr, int k) {
        sort(arr.begin(), arr.end());
        int m = arr[(arr.size() - 1) / 2];
        
        int left = 0, right = arr.size() - 1;
        vector<int> result;
        for (int i = 0; i < k; i++) {
            if (abs(arr[right] - m) >= abs(arr[left] - m)) {
                result.push_back(arr[right]);
                right--;
            } else {
                result.push_back(arr[left]);
                left++;
            }
        }
        return result;
    }
};
