class Solution {
    public String reformat(String s) {
        List<Character> digits = new ArrayList<>();
        List<Character> letters = new ArrayList<>();
        for (char c : s.toCharArray()) {
            if (Character.isDigit(c)) {
                digits.add(c);
            } else if (Character.isLetter(c)) {
                letters.add(c);
            }
        }
        if (Math.abs(digits.size() - letters.size()) >= 2) {
            return "";
        }
        char[] ans = new char[s.length()];
        if (digits.size() > letters.size()) {
            for (int i = 0; i < s.length(); i++) {
                if (i % 2 == 0) {
                    ans[i] = digits.get(i / 2);
                } else {
                    ans[i] = letters.get(i / 2);
                }
            }
        } else {
            for (int i = 0; i < s.length(); i++) {
                if (i % 2 == 0) {
                    ans[i] = letters.get(i / 2);
                } else {
                    ans[i] = digits.get(i / 2);
                }
            }
        }
        return new String(ans);
    }
}
