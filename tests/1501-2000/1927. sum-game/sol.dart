class Solution {
  bool sumGame(String num) {
    int n = num.length;
    int half = n ~/ 2;
    int sumLeft = 0, sumRight = 0;
    int qLeft = 0, qRight = 0;

    for (int i = 0; i < half; i++) {
      if (num[i] == '?') {
        qLeft++;
      } else {
        sumLeft += int.parse(num[i]);
      }
    }

    for (int i = half; i < n; i++) {
      if (num[i] == '?') {
        qRight++;
      } else {
        sumRight += int.parse(num[i]);
      }
    }

    return (sumLeft - sumRight) * 2 != (qRight - qLeft) * 9;
  }
}
