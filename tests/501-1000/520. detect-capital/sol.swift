class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        return word == word.uppercased() || 
               word == word.lowercased() || 
               word == word.prefix(1).uppercased() + word.dropFirst().lowercased()
    }
}
