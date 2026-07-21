class Solution {
public:
    int maxStudents(vector<vector<char>>& seats) {
        int m = seats.size();
        int n = seats[0].size();
        vector<int> available(m);
        for (int i = 0; i < m; i++) {
            int mask = 0;
            for (int j = 0; j < n; j++) {
                if (seats[i][j] == '.') {
                    mask |= 1 << j;
                }
            }
            available[i] = mask;
        }

        vector<int> validMasks;
        for (int mask = 0; mask < (1 << n); mask++) {
            if ((mask & (mask << 1)) == 0) {
                validMasks.push_back(mask);
            }
        }

        unordered_map<int, int> dp{{0, 0}};
        for (int row = 0; row < m; row++) {
            unordered_map<int, int> nextDp;
            for (int current : validMasks) {
                if (current & ~available[row]) continue;
                int count = __builtin_popcount(current);
                for (auto& [previous, total] : dp) {
                    if (current & ((previous << 1) | (previous >> 1))) continue;
                    nextDp[current] = max(nextDp[current], total + count);
                }
            }
            dp = nextDp;
        }

        int maxVal = 0;
        for (auto& [_, val] : dp) {
            maxVal = max(maxVal, val);
        }
        return maxVal;
    }
};
