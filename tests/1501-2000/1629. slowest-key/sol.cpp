class Solution {
public:
    char slowestKey(vector<int>& releaseTimes, string keysPressed) {
        int maxTime = releaseTimes[0];
        char ans = keysPressed[0];
        for (int i = 1; i < releaseTimes.size(); i++) {
            int currTime = releaseTimes[i] - releaseTimes[i-1];
            if (currTime > maxTime) {
                maxTime = currTime;
                ans = keysPressed[i];
            } else if (currTime == maxTime) {
                ans = max(ans, keysPressed[i]);
            }
        }
        return ans;
    }
};
