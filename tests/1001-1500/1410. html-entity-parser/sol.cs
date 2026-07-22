public class Solution {
    public string EntityParser(string text) {
        var entities = new Dictionary<string, string> {
            {"&quot", "\""},
            {"&apos", "'"},
            {"&amp", "&"},
            {"&gt", ">"},
            {"&lt", "<"},
            {"&frasl", "/"}
        };
        
        var pattern = new Regex(@"&[^;&\s]+;");
        
        return pattern.Replace(text, match => {
            string matched = match.Value;
            string entity = matched.Substring(0, matched.Length - 1);
            return entities.ContainsKey(entity) ? entities[entity] : matched;
        });
    }
}
