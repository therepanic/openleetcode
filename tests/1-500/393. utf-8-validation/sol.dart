class Solution {
  bool validUtf8(List<int> data) {
    int i = 0;
    while (i < data.length) {
      int b = data[i];
      if (b >> 7 == 0) {
        i++;
      } else if (b >> 5 == 6) {
        if (i + 1 >= data.length) return false;
        if (data[i+1] >> 6 != 2) return false;
        i += 2;
      } else if (b >> 4 == 14) {
        if (i + 2 >= data.length) return false;
        if (data[i+1] >> 6 != 2 || data[i+2] >> 6 != 2) return false;
        i += 3;
      } else if (b >> 3 == 30) {
        if (i + 3 >= data.length) return false;
        if (data[i+1] >> 6 != 2 || data[i+2] >> 6 != 2 || data[i+3] >> 6 != 2) return false;
        i += 4;
      } else {
        return false;
      }
    }
    return true;
  }
}
