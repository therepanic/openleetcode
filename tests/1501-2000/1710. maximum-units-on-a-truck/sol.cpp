class Solution {
public:
    int maximumUnits(vector<vector<int>>& boxTypes, int truckSize) {
        sort(boxTypes.begin(), boxTypes.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[1] > b[1];
        });
        int ans = 0;
        int remaining = truckSize;
        for (vector<int>& box : boxTypes) {
            int quantitytaken = min(remaining, box[0]);
            ans += box[1] * quantitytaken;
            remaining -= quantitytaken;
            if (remaining == 0) break;
        }
        return ans;
    }
};
