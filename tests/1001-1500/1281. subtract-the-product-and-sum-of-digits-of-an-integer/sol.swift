class Solution {
    func subtractProductAndSum(_ n: Int) -> Int {
        var sum_digits = 0
        var product_digits = 1
        var num = n
        
        while num > 0 {
            let digit = num % 10
            sum_digits += digit
            product_digits *= digit
            num /= 10
        }
        
        return product_digits - sum_digits
    }
}
