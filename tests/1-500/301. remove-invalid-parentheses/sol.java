class Solution {
    public List<String> removeInvalidParentheses(String s) {
        Set<String> level = new HashSet<>();
        level.add(s);
        while (true) {
            List<String> valid = new ArrayList<>();
            for (String str : level) {
                if (isValid(str)) {
                    valid.add(str);
                }
            }
            if (!valid.isEmpty()) {
                return valid;
            }
            Set<String> nextLevel = new HashSet<>();
            for (String str : level) {
                for (int i = 0; i < str.length(); i++) {
                    nextLevel.add(str.substring(0, i) + str.substring(i + 1));
                }
            }
            level = nextLevel;
        }
    }
    
    private boolean isValid(String s) {
        int ctr = 0;
        for (char ch : s.toCharArray()) {
            if (ch == '(') {
                ctr++;
            } else if (ch == ')') {
                if (ctr == 0) return false;
                ctr--;
            }
        }
        return ctr == 0;
    }
}
