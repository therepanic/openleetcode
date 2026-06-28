class Solution {
    public List<String> removeComments(String[] source) {
        boolean inBlock = false;
        List<String> ans = new ArrayList<>();
        StringBuilder newline = new StringBuilder();
        for (String line : source) {
            int i = 0;
            if (!inBlock) {
                newline = new StringBuilder();
            }
            while (i < line.length()) {
                if (i + 1 < line.length() && line.charAt(i) == '/' && line.charAt(i + 1) == '*' && !inBlock) {
                    inBlock = true;
                    i++;
                } else if (i + 1 < line.length() && line.charAt(i) == '*' && line.charAt(i + 1) == '/' && inBlock) {
                    inBlock = false;
                    i++;
                } else if (!inBlock && i + 1 < line.length() && line.charAt(i) == '/' && line.charAt(i + 1) == '/') {
                    break;
                } else if (!inBlock) {
                    newline.append(line.charAt(i));
                }
                i++;
            }
            if (newline.length() > 0 && !inBlock) {
                ans.add(newline.toString());
            }
        }
        return ans;
    }
}
