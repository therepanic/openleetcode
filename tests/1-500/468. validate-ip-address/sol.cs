public class Solution {
    public string ValidIPAddress(string queryIP) {
        if (queryIP.Count(c => c == '.') == 3) {
            string[] parts = queryIP.Split('.');
            bool valid = true;
            foreach (string p in parts) {
                if (string.IsNullOrEmpty(p) || !p.All(char.IsDigit)) {
                    valid = false;
                    break;
                }
                int num;
                if (!int.TryParse(p, out num) || num < 0 || num > 255 || num.ToString() != p) {
                    valid = false;
                    break;
                }
            }
            if (valid) return "IPv4";
        } else if (queryIP.Count(c => c == ':') == 7) {
            string[] parts = queryIP.Split(':');
            bool valid = true;
            foreach (string p in parts) {
                if (p.Length < 1 || p.Length > 4 || !System.Text.RegularExpressions.Regex.IsMatch(p, @"^[0-9a-fA-F]+$")) {
                    valid = false;
                    break;
                }
            }
            if (valid) return "IPv6";
        }
        return "Neither";
    }
}
