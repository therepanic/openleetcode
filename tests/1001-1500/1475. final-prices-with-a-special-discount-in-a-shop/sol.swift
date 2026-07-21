class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        var prices = prices
        var stack: [Int] = []
        for i in 0..<prices.count {
            while let last = stack.last, prices[last] >= prices[i] {
                let index = stack.removeLast()
                prices[index] -= prices[i]
            }
            stack.append(i)
        }
        return prices
    }
}
