public class Solution {
    public IList<string> ReadBinaryWatch(int turnedOn) {
        var result = new List<string>();
        for (int hour = 0; hour < 12; hour++) {
            for (int minute = 0; minute < 60; minute++) {
                if (PopCount(hour) + PopCount(minute) == turnedOn) {
                    result.Add($"{hour}:{minute:D2}");
                }
            }
        }
        return result;
    }

    private int PopCount(int x) {
        int count = 0;
        while (x > 0) {
            count += x & 1;
            x >>= 1;
        }
        return count;
    }
}
