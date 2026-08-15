class Solution {
    public int numberOfRounds(String loginTime, String logoutTime) {
        java.util.function.Function<String, Integer> toMinutes = t -> {
            String[] parts = t.split(":");
            return Integer.parseInt(parts[0]) * 60 + Integer.parseInt(parts[1]);
        };

        int start = toMinutes.apply(loginTime);
        int end = toMinutes.apply(logoutTime);

        if (end < start) {
            end += 24 * 60;
        }

        int startRound = (start + 14) / 15;
        int endRound = end / 15;

        return Math.max(0, endRound - startRound);
    }
}
