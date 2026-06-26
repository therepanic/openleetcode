class Solution {
public:
    int findMinMoves(vector<int>& machines) {
        int n = machines.size();
        int total = 0;
        for (int m : machines) {
            total += m;
        }
        if (total % n != 0) {
            return -1;
        }
        int avg = total / n;
        vector<int> imbalances(n);
        for (int i = 0; i < n; i++) {
            imbalances[i] = machines[i] - avg;
        }
        int res = 0;
        int d = 0;
        for (int imb : imbalances) {
            res = max(res, abs(d));
            res = max(res, imb);
            d += imb;
        }
        return res;
    }
};
