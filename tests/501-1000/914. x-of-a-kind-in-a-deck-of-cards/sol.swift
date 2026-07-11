class Solution {
    func hasGroupsSizeX(_ deck: [Int]) -> Bool {
        var counts: [Int: Int] = [:]
        for card in deck {
            counts[card, default: 0] += 1
        }
        
        func getGcd(_ a: Int, _ b: Int) -> Int {
            var x = a
            var y = b
            while y > 0 {
                let temp = y
                y = x % y
                x = temp
            }
            return x
        }
        
        let frequencies = Array(counts.values)
        var currentGcd = frequencies[0]
        
        for count in frequencies.dropFirst() {
            currentGcd = getGcd(currentGcd, count)
            if currentGcd == 1 {
                return false
            }
        }
        
        return currentGcd >= 2
    }
}
