class Solution {
    public boolean isValid(String s) {
        if (s.equals("abc")) {
            return true;
        }
        if (s.charAt(0) != 'a' || s.charAt(s.length() - 1) != 'c') {
            return false;
        }
        java.util.List<Character> l = new java.util.ArrayList<>();
        for (char c : s.toCharArray()) {
            l.add(c);
        }
        for (int j = 0; j < l.size(); j++) {
            for (int i = 0; i <= l.size() - 3; i++) {
                if (l.equals(java.util.Arrays.asList('a', 'b', 'c'))) {
                    return true;
                }
                if (i + 2 <= l.size() - 1) {
                    if (l.get(i) == 'a' && l.get(i+1) == 'b' && l.get(i+2) == 'c') {
                        for (int x = 0; x < 3; x++) {
                            l.remove(i);
                        }
                        i = -1;
                        continue;
                    }
                }
            }
        }
        if (l.size() == 0) {
            return true;
        }
        return false;
    }
}
