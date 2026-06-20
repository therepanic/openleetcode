class Solution {
public:
    bool increasingTriplet(vector<int>& nums) {
        int a = INT_MAX;
        int b = INT_MAX;
        bool f = false;
        for (int x : nums) {
            if (x <= a) {
                a = x;
            } else if (x <= b) {
                b = x;
            } else {
                f = true;
            }
        }
        return f;
    }
};
