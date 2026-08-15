class Solution {
public:
    int getWinner(vector<int>& arr, int k) {
        int candidate = arr[0];
        int streak = 0;
        for (int i = 1; i < arr.size(); ++i) {
            if (candidate > arr[i]) {
                streak++;
            } else {
                candidate = arr[i];
                streak = 1;
            }
            if (streak == k) return candidate;
        }
        return candidate;
    }
};
