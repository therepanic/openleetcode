class Solution {
    public String makeFancyString(String s) {
        if (s.isEmpty()) return "";
        StringBuilder result = new StringBuilder();
        result.append(s.charAt(0));
        char last = s.charAt(0);
        int count = 1;

        for (int i = 1; i < s.length(); i++) {
            if (s.charAt(i) != last) {
                last = s.charAt(i);
                count = 0;
            }

            count++;
            if (count > 2) continue;

            result.append(s.charAt(i));
        }

        return result.toString();
    }
}
