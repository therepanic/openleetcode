class Solution {
  int countBalls(int lowLimit, int highLimit) {
    Map<int, int> boxCount = {};
    int maxBalls = 0;
    for (int num = lowLimit; num <= highLimit; num++) {
      int box = num.toString().split('').map((c) => int.parse(c)).reduce((a, b) => a + b);
      boxCount[box] = (boxCount[box] ?? 0) + 1;
      if (boxCount[box]! > maxBalls) {
        maxBalls = boxCount[box]!;
      }
    }
    return maxBalls;
  }
}
