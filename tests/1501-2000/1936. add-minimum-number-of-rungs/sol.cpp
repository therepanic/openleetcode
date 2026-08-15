class Solution {
public:
    int addRungs(vector<int>& rungs, int dist) {
        int curr = 0;
        int res = 0;
        for (int rung : rungs) {
            if (rung - curr > dist) {
                res += (rung - curr - 1) / dist;
            }
            curr = rung;
        }
        return res;
    }
};
