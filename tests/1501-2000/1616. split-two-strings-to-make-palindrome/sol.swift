class Solution {
    func checkPalindromeFormation(_ a: String, _ b: String) -> Bool {
        return check(a, b) || check(b, a)
    }

    private func check(_ a: String, _ b: String) -> Bool {
        let arrA = Array(a)
        let arrB = Array(b)
        var i = 0
        var j = arrA.count - 1
        while i < j && arrA[i] == arrB[j] {
            i += 1
            j -= 1
        }
        if i >= j {
            return true
        }
        return isPalindrome(String(arrA[i...j])) || isPalindrome(String(arrB[i...j]))
    }

    private func isPalindrome(_ s: String) -> Bool {
        return s == String(s.reversed())
    }
}
