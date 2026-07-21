class Solution {
    public String arrangeWords(String text) {
        String[] s = text.split(" ");
        Arrays.sort(s, (a, b) -> Integer.compare(a.length(), b.length()));
        for (int i = 0; i < s.length; i++) {
            s[i] = s[i].toLowerCase();
        }
        s[0] = s[0].substring(0, 1).toUpperCase() + s[0].substring(1);
        return String.join(" ", s);
    }
}
