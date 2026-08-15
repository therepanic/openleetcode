class Solution {
public:
    int maximumScore(int a, int b, int c) {
        int sum = a + b + c;
        return min(sum - max(a, max(b, c)), sum / 2);
    }
};
