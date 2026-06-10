public class Solution {
    public string ConvertToTitle(int columnNumber) {
        var chars = new System.Text.StringBuilder();
        while (columnNumber > 0) {
            columnNumber--;
            chars.Append((char)('A' + columnNumber % 26));
            columnNumber /= 26;
        }
        char[] arr = chars.ToString().ToCharArray();
        System.Array.Reverse(arr);
        return new string(arr);
    }
}
