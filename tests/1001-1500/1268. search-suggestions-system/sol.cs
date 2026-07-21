public class Solution {
    public IList<IList<string>> SuggestedProducts(string[] products, string searchWord) {
        Array.Sort(products);
        var answer = new List<IList<string>>();
        var prefix = "";
        foreach (char ch in searchWord) {
            prefix += ch;
            var current = new List<string>();
            foreach (string product in products) {
                if (product.StartsWith(prefix)) {
                    current.Add(product);
                    if (current.Count == 3) break;
                }
            }
            answer.Add(current);
        }
        return answer;
    }
}
