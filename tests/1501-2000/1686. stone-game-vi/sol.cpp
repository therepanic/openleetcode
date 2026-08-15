class Solution {
public:
    int stoneGameVI(vector<int>& aliceValues, vector<int>& bobValues) {
        int n = aliceValues.size();
        vector<vector<int>> combined(n, vector<int>(3));
        for (int i = 0; i < n; i++) {
            combined[i][0] = aliceValues[i] + bobValues[i];
            combined[i][1] = aliceValues[i];
            combined[i][2] = bobValues[i];
        }
        sort(combined.begin(), combined.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[0] > b[0];
        });

        int alice = 0, bob = 0;
        for (int i = 0; i < n; i++) {
            if (i % 2 == 0) {
                alice += combined[i][1];
            } else {
                bob += combined[i][2];
            }
        }

        if (alice > bob) return 1;
        else if (alice < bob) return -1;
        else return 0;
    }
};
