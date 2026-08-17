class Solution {
public:
    int countBalls(int lowLimit, int highLimit) {
        unordered_map<int, int> boxCount;
        int maxBalls = 0;
        for (int num = lowLimit; num <= highLimit; num++) {
            int box = 0;
            int temp = num;
            while (temp > 0) {
                box += temp % 10;
                temp /= 10;
            }
            boxCount[box]++;
            maxBalls = max(maxBalls, boxCount[box]);
        }
        return maxBalls;
    }
};
