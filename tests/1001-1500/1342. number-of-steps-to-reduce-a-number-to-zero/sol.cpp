class Solution {
public:
    int numberOfSteps(int num) {
        if (num == 0) return 0;
        return (sizeof(int) * 8 - __builtin_clz(num)) - 1 + __builtin_popcount(num);
    }
};
