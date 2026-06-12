class Solution {
    public String convertToTitle(int columnNumber) {
        StringBuilder chars = new StringBuilder();
        while (columnNumber > 0) {
            columnNumber--;
            chars.append((char) ('A' + columnNumber % 26));
            columnNumber /= 26;
        }
        return chars.reverse().toString();
    }
}
