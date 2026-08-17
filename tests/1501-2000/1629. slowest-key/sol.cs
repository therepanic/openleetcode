public class Solution {
    public char SlowestKey(int[] releaseTimes, string keysPressed) {
        int maxTime = releaseTimes[0];
        char ans = keysPressed[0];
        for (int i = 1; i < releaseTimes.Length; i++) {
            int currTime = releaseTimes[i] - releaseTimes[i-1];
            if (currTime > maxTime) {
                maxTime = currTime;
                ans = keysPressed[i];
            } else if (currTime == maxTime) {
                ans = (char)Math.Max(ans, keysPressed[i]);
            }
        }
        return ans;
    }
}
