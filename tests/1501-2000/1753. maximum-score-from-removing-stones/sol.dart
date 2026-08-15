class Solution {
  int maximumScore(int a, int b, int c) {
    int sum = a + b + c;
    return (sum - [a, b, c].reduce((x, y) => x > y ? x : y)) < (sum ~/ 2) 
        ? sum - [a, b, c].reduce((x, y) => x > y ? x : y) 
        : sum ~/ 2;
  }
}
