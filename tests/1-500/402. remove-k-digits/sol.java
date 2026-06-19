class Solution {
    public String removeKdigits(String num, int k) {
        StringBuilder s = new StringBuilder();
        for (char c : num.toCharArray()) {
            while (k > 0 && s.length() > 0 && s.charAt(s.length() - 1) > c) {
                s.deleteCharAt(s.length() - 1);
                k--;
            }
            s.append(c);
        }
        
        s.setLength(s.length() - k);
        String result = s.toString().replaceFirst("^0+", "");
        return result.isEmpty() ? "0" : result;
    }

    public String RemoveKdigits(String num, int k) {
        return removeKdigits(num, k);
    }
}
