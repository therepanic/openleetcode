class Solution {
public:
    int arrangeCoins(int n) {
        return (int)((sqrt(8.0 * n + 1) - 1) / 2);
    }
};
