class Solution {
    public String orderlyQueue(String s, int k) {
        if (k > 1) {
            char[] chars = s.toCharArray();
            java.util.Arrays.sort(chars);
            return new String(chars);
        }
        
        String res = s;
        for (int i = 0; i < s.length(); i++) {
            s = s.substring(1) + s.charAt(0);
            if (s.compareTo(res) < 0) {
                res = s;
            }
        }
        
        return res;
    }
}
