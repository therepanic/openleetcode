class Solution {
public:
    int maximumSum(vector<int>& arr) {
        int n = arr.size();
        if (n == 1) {
            return arr[0];
        }
        
        int maxNoDelete = arr[0];
        int maxOneDelete = arr[0];
        int result = arr[0];
        
        for (int i = 1; i < n; i++) {
            int prevNoDelete = maxNoDelete;
            maxNoDelete = max(maxNoDelete + arr[i], arr[i]);
            maxOneDelete = max(maxOneDelete + arr[i], prevNoDelete);
            result = max(result, max(maxNoDelete, maxOneDelete));
        }
        
        return result;
    }
};
