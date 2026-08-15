class Solution {
    public String reorderSpaces(String text) {
        String[] words = text.trim().split("\\s+");
        int total = text.length() - text.replace(" ", "").length();
        if (words.length == 1) {
            return words[0] + " ".repeat(total);
        }
        int gap = total / (words.length - 1);
        int extra = total % (words.length - 1);
        return String.join(" ".repeat(gap), words) + " ".repeat(extra);
    }
}
