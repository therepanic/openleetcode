class Solution {
    public char slowestKey(int[] releaseTimes, String keysPressed) {
        int maxTime = releaseTimes[0];
        char ans = keysPressed.charAt(0);
        for (int i = 1; i < releaseTimes.length; i++) {
            int currTime = releaseTimes[i] - releaseTimes[i-1];
            if (currTime > maxTime) {
                maxTime = currTime;
                ans = keysPressed.charAt(i);
            } else if (currTime == maxTime) {
                ans = (char) Math.max(ans, keysPressed.charAt(i));
            }
        }
        return ans;
    }
}
