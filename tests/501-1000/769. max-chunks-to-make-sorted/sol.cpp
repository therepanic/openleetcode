class Solution {
public:
    int maxChunksToSorted(vector<int>& arr) {
        int ans = 0;
        int prevMax = 0;
        for (int idx = 0; idx < arr.size(); idx++) {
            prevMax = max(prevMax, arr[idx]);
            if (prevMax == idx) {
                ans++;
            }
        }
        return ans;
    }
};
