public class Solution {
    public int NumUniqueEmails(string[] emails) {
        HashSet<string> res = new HashSet<string>();
        foreach (string email in emails) {
            int atIndex = email.IndexOf('@');
            string local = email.Substring(0, atIndex);
            string domain = email.Substring(atIndex + 1);
            
            int plusIndex = local.IndexOf('+');
            if (plusIndex != -1) {
                local = local.Substring(0, plusIndex);
            }
            local = local.Replace(".", "");
            res.Add(local + "@" + domain);
        }
        return res.Count;
    }
}
