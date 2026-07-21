class Solution {
    public double angleClock(int hour, int minutes) {
        return Math.acos(Math.cos((330 * hour + 5.5 * minutes) * 0.0174532925)) * 57.2957795;
    }
}
