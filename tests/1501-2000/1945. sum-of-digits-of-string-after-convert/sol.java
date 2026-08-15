class Solution {
    public int getLucky(String s, int k) {
        String res = "";
        for (char c : s.toCharArray()) {
            res += (c - 'a' + 1);
        }
        for (int i = 0; i < k; i++) {
            int sum = 0;
            for (char c : res.toCharArray()) {
                sum += c - '0';
            }
            res = Integer.toString(sum);
        }
        return Integer.parseInt(res);
    }
}
