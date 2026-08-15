class Solution {
  String slowestKey(List<int> releaseTimes, String keysPressed) {
    int maxTime = releaseTimes[0];
    String ans = keysPressed[0];
    for (int i = 1; i < releaseTimes.length; i++) {
      int currTime = releaseTimes[i] - releaseTimes[i-1];
      if (currTime > maxTime) {
        maxTime = currTime;
        ans = keysPressed[i];
      } else if (currTime == maxTime) {
        if (keysPressed[i].compareTo(ans) > 0) {
          ans = keysPressed[i];
        }
      }
    }
    return ans;
  }
}
