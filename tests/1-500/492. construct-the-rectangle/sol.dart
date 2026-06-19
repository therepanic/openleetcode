import 'dart:math';

class Solution {
  List<int> constructRectangle(int area) {
    int w = sqrt(area).toInt();
    while (area % w != 0) {
      w--;
    }
    return [area ~/ w, w];
  }
}
