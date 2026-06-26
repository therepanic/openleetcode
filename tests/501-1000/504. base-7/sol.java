class Solution {
    public String convertToBase7(int num) {
        if (num == 0) {
            return "0";
        }
        String sign = num < 0 ? "-" : "";
        num = Math.abs(num);
        StringBuilder result = new StringBuilder();
        while (num > 0) {
            result.insert(0, num % 7);
            num /= 7;
        }
        return sign + result.toString();
    }
}
