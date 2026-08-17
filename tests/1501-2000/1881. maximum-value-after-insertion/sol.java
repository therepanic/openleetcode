class Solution {
    public String maxValue(String n, int x) {
        String xs = String.valueOf(x);
        if (n.charAt(0) != '-') {
            for (int i = 0; i < n.length(); i++) {
                if (xs.charAt(0) > n.charAt(i)) {
                    return n.substring(0, i) + xs + n.substring(i);
                }
            }
            return n + xs;
        } else {
            for (int i = 1; i < n.length(); i++) {
                if (xs.charAt(0) < n.charAt(i)) {
                    return n.substring(0, i) + xs + n.substring(i);
                }
            }
            return n + xs;
        }
    }
}
