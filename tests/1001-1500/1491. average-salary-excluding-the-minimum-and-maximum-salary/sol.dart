class Solution {
  double average(List<int> salary) {
    int max = salary[0];
    int min = salary[0];
    for (int s in salary) {
      if (s > max) max = s;
      if (s < min) min = s;
    }
    double total = 0.0;
    int count = 0;
    for (int s in salary) {
      if (s != max && s != min) {
        total += s;
        count++;
      }
    }
    return total / count;
  }
}
