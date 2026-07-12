class Solution {
    public boolean backspaceCompare(String s, String t) {
        int ps = s.length() - 1;
        int pt = t.length() - 1;

        while (ps >= 0 || pt >= 0) {
            ps = getNextValidCharIndex(s, ps);
            pt = getNextValidCharIndex(t, pt);

            if (ps < 0 && pt < 0) {
                return true;
            }
            if (ps < 0 || pt < 0) {
                return false;
            } else if (s.charAt(ps) != t.charAt(pt)) {
                return false;
            }

            ps--;
            pt--;
        }

        return true;
    }

    private int getNextValidCharIndex(String s, int end) {
        int backspaceCount = 0;
        while (end >= 0) {
            if (s.charAt(end) == '#') {
                backspaceCount++;
            } else if (backspaceCount > 0) {
                backspaceCount--;
            } else {
                break;
            }
            end--;
        }
        return end;
    }
}
