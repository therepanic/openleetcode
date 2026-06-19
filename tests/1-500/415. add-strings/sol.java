class Solution {
    public String addStrings(String num1, String num2) {
        StringBuilder result = new StringBuilder();
        int carry = 0;
        int i = num1.length() - 1, j = num2.length() - 1;
        
        while (i >= 0 || j >= 0 || carry > 0) {
            int digit1 = i >= 0 ? num1.charAt(i) - '0' : 0;
            int digit2 = j >= 0 ? num2.charAt(j) - '0' : 0;
            
            int total = digit1 + digit2 + carry;
            carry = total / 10;
            result.append((char)(total % 10 + '0'));
            
            i--;
            j--;
        }
        
        return result.reverse().toString();
    }
}
