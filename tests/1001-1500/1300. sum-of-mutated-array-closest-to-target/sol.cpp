class Solution {
public:
    int findBestValue(vector<int>& arr, int target) {
        auto getMutatedSum = [&](int value) -> int {
            int sum = 0;
            for (int x : arr) {
                sum += min(x, value);
            }
            return sum;
        };
        
        int low = 0;
        int high = *max_element(arr.begin(), arr.end());
        int result = high;
        int minDiff = INT_MAX;
        
        while (low <= high) {
            int mid = low + (high - low) / 2;
            int currSum = getMutatedSum(mid);
            int diff = abs(currSum - target);
            
            if (diff < minDiff || (diff == minDiff && mid < result)) {
                minDiff = diff;
                result = mid;
            }
            
            if (currSum < target) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        
        return result;
    }
};
