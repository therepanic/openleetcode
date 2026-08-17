import java.util.*;

class Solution {
    public int secondHighest(String s) {
        Set<Integer> digits = new HashSet<>();
        for (char c : s.toCharArray()) {
            if (Character.isDigit(c)) {
                digits.add(c - '0');
            }
        }
        if (digits.size() > 1) {
            int max = Collections.max(digits);
            digits.remove(max);
            return Collections.max(digits);
        }
        return -1;
    }
}
