public class Solution {
    public int NumberOfRounds(string loginTime, string logoutTime) {
        Func<string, int> toMinutes = t => {
            var parts = t.Split(':');
            return int.Parse(parts[0]) * 60 + int.Parse(parts[1]);
        };

        int start = toMinutes(loginTime);
        int end = toMinutes(logoutTime);

        if (end < start) {
            end += 24 * 60;
        }

        int startRound = (start + 14) / 15;
        int endRound = end / 15;

        return Math.Max(0, endRound - startRound);
    }
}
