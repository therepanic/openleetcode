public class Solution {
    public int MaxDiff(int num) {
        string numStr = num.ToString();
        var uniqueDigits = new HashSet<char>(numStr);
        int maxVal = num;
        int minVal = num;
        
        foreach (char digit in uniqueDigits) {
            for (char newDigit = '0'; newDigit <= '9'; newDigit++) {
                if (numStr[0] == digit && newDigit == '0') {
                    continue;
                }
                string newNumStr = numStr.Replace(digit, newDigit);
                int newNum = int.Parse(newNumStr);
                maxVal = Math.Max(maxVal, newNum);
                minVal = Math.Min(minVal, newNum);
            }
        }
        
        return maxVal - minVal;
    }
}
