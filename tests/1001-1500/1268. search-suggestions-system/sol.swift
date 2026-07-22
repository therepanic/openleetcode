class Solution {
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        let products = products.sorted()
        var answer = [[String]]()
        var prefix = ""
        for ch in searchWord {
            prefix.append(ch)
            answer.append(Array(products.filter { $0.hasPrefix(prefix) }.prefix(3)))
        }
        return answer
    }
}
