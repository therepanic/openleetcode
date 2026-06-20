class Solution {
    public String getHint(String secret, String guess) {
        int bulls = 0;
        int[] secretCounts = new int[10];
        int[] guessCounts = new int[10];

        for (int i = 0; i < secret.length(); i++) {
            char s = secret.charAt(i);
            char g = guess.charAt(i);
            if (s == g) {
                bulls++;
            } else {
                secretCounts[s - '0']++;
                guessCounts[g - '0']++;
            }
        }

        int cows = 0;
        for (int i = 0; i < 10; i++) {
            cows += Math.min(secretCounts[i], guessCounts[i]);
        }
        return bulls + "A" + cows + "B";
    }
}
