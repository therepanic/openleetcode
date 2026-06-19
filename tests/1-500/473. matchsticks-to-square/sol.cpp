class Solution {
public:
    bool makesquare(vector<int>& matchsticks) {
        int total = accumulate(matchsticks.begin(), matchsticks.end(), 0);
        if (total % 4 != 0) return false;
        int side = total / 4;
        
        sort(matchsticks.begin(), matchsticks.end(), greater<int>());
        
        vector<int> sides(4, 0);
        return backtrack(matchsticks, 0, sides, side);
    }
    
    bool backtrack(vector<int>& matchsticks, int index, vector<int>& sides, int side) {
        if (index == matchsticks.size()) {
            return sides[0] == side && sides[1] == side && sides[2] == side && sides[3] == side;
        }
        for (int i = 0; i < 4; i++) {
            if (sides[i] + matchsticks[index] <= side) {
                sides[i] += matchsticks[index];
                if (backtrack(matchsticks, index + 1, sides, side)) return true;
                sides[i] -= matchsticks[index];
            }
        }
        return false;
    }
};
