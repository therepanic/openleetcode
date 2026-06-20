public class Solution {
    public string AddStrings(string num1, string num2) {
        var result = new System.Text.StringBuilder();
        int carry = 0;
        int i = num1.Length - 1, j = num2.Length - 1;
        
        while (i >= 0 || j >= 0 || carry > 0) {
            int digit1 = i >= 0 ? num1[i] - '0' : 0;
            int digit2 = j >= 0 ? num2[j] - '0' : 0;
            
            int total = digit1 + digit2 + carry;
            carry = total / 10;
            result.Append((char)(total % 10 + '0'));
            
            i--;
            j--;
        }
        
        var charArray = result.ToString().ToCharArray();
        Array.Reverse(charArray);
        return new string(charArray);
    }
}
