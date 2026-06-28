class Solution {
public:
    int maxChunksToSorted(vector<int>& arr) {
        int n = arr.size();
        vector<int> min_right(n);
        int current_min = INT_MAX;
        for (int i = n - 1; i >= 0; i--) {
            if (arr[i] < current_min) {
                current_min = arr[i];
            }
            min_right[i] = current_min;
        }
        
        int chunks = 0;
        int current_max = INT_MIN;
        for (int i = 0; i < n - 1; i++) {
            if (arr[i] > current_max) {
                current_max = arr[i];
            }
            if (current_max <= min_right[i + 1]) {
                chunks++;
            }
        }
        return chunks + 1;
    }
};
