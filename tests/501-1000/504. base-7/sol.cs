public class Solution {
    public string ConvertToBase7(int num) {
        if (num == 0) {
            return "0";
        }
        string sign = num < 0 ? "-" : "";
        num = Math.Abs(num);
        string result = "";
        while (num > 0) {
            result = (num % 7).ToString() + result;
            num /= 7;
        }
        return sign + result;
    }
}
