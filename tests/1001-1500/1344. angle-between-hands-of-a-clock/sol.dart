class Solution {
  double angleClock(int hour, int minutes) {
    return acos(cos((330 * hour + 5.5 * minutes) * 0.0174532925)) * 57.2957795;
  }
}
