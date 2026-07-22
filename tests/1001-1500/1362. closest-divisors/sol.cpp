class Solution {
public:
    vector<int> closestDivisors(int num) {
        int start = sqrt(num + 2);
        for (int d = start; d >= 1; d--) {
            if ((num + 1) % d == 0) {
                return {d, (num + 1) / d};
            }
            if ((num + 2) % d == 0) {
                return {d, (num + 2) / d};
            }
        }
        return {};
    }
};
