public class Solution {
    public string ReformatNumber(string number) {
        string phoneCleared = new string(number.Where(char.IsDigit).ToArray());
        List<string> result = new List<string>();
        
        while (phoneCleared.Length > 4) {
            result.Add(phoneCleared.Substring(0, 3));
            phoneCleared = phoneCleared.Substring(3);
        }
        
        if (phoneCleared.Length == 4) {
            result.Add(phoneCleared.Substring(0, 2));
            result.Add(phoneCleared.Substring(2));
        } else if (phoneCleared.Length > 0) {
            result.Add(phoneCleared);
        }
        
        return string.Join("-", result);
    }
}
