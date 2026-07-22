public class Solution {
    public double AngleClock(int hour, int minutes) {
        return Math.Acos(Math.Cos((330.0 * hour + 5.5 * minutes) * 0.0174532925)) * 57.2957795;
    }
}
