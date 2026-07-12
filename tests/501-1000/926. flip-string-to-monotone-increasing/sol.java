class Solution {
    public int minFlipsMonoIncr(String s) {
        int zeroes = 0;
        int ones = 0;
        
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '0') {
                zeroes++;
            }
        }
        
        int output = zeroes;
        
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '0') {
                zeroes--;
            } else if (s.charAt(i) == '1') {
                ones++;
            }
            output = Math.min(output, zeroes + ones);
        }
        
        return output;
    }
}
