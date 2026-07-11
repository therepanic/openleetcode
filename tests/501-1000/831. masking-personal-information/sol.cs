public class Solution {
    public string MaskPII(string s) {
        if (s.Contains('@')) {
            string[] parts = s.Split('@');
            string name = parts[0].ToLower();
            string domain = parts[1].ToLower();
            name = name[0] + "*****" + name[name.Length - 1];
            return name + "@" + domain;
        } else {
            string gg = "";
            foreach (char x in s) {
                if (char.IsDigit(x)) {
                    gg += x;
                }
            }
            int l = gg.Length;
            if (l > 10) {
                return "+" + new string('*', l - 10) + "-***-***-" + gg.Substring(l - 4);
            }
            return "***-***-" + gg.Substring(l - 4);
        }
    }
}
