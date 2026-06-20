class Solution {
  int findNthDigit(int n) {
    int i = 1;
    int count = 9;
    int start = 1;

    while (n > i * count) {
      n -= i * count;
      i++;
      count *= 10;
      start *= 10;
    }

    int number = start + ((n - 1) ~/ i);
    return int.parse(number.toString()[(n - 1) % i]);
  }
}
