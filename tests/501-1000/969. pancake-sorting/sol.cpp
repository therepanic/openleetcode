class Solution {
public:
    vector<int> pancakeSort(vector<int>& arr) {
        int n = arr.size();
        vector<int> result;
        
        for (int i = 0; i < n; i++) {
            int target = n - i;
            int position = 0;
            
            for (int j = 0; j < n - i; j++) {
                if (arr[j] == target) {
                    position = j;
                    break;
                }
            }
            
            if (position == n - i - 1) {
                continue;
            }
            
            if (position > 0) {
                result.push_back(position + 1);
                reverse(arr.begin(), arr.begin() + position + 1);
            }
            
            result.push_back(n - i);
            reverse(arr.begin(), arr.begin() + n - i);
        }
        
        return result;
    }
};
