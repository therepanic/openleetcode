class Solution {
    func entityParser(_ text: String) -> String {
        let entities: [String: String] = [
            "&quot": "\"",
            "&apos": "'",
            "&amp": "&",
            "&gt": ">",
            "&lt": "<",
            "&frasl": "/"
        ]
        
        let pattern = #/&[^;&\s]+;/#
        
        return text.replacing(pattern) { match in
            let matched = String(match.output)
            let entity = String(matched.dropLast())
            return entities[entity] ?? matched
        }
    }
}
