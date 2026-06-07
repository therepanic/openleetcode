public class Solution {
    public String countAndSay(int n) {
        String current = "1";
        for (int step = 1; step < n; step++) {
            StringBuilder next = new StringBuilder();
            for (int i = 0; i < current.length();) {
                int j = i;
                while (j < current.length() && current.charAt(j) == current.charAt(i)) j++;
                next.append(j - i).append(current.charAt(i));
                i = j;
            }
            current = next.toString();
        }
        return current;
    }
}
