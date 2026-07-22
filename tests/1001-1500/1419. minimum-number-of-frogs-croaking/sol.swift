class Solution {
    func minNumberOfFrogs(_ croakOfFrogs: String) -> Int {
        var maxi = 0
        var curr = 0
        var c = 0, r = 0, o = 0, a = 0, k = 0
        for char in croakOfFrogs {
            if char == "c" {
                c += 1
                curr += 1
            } else if char == "r" {
                r += 1
            } else if char == "o" {
                o += 1
            } else if char == "a" {
                a += 1
            } else if char == "k" {
                k += 1
                curr -= 1
            }
            maxi = max(maxi, curr)
            if c < r || r < o || o < a || a < k {
                return -1
            }
        }
        if curr == 0 && c == r && r == o && o == a && a == k {
            return maxi
        } else {
            return -1
        }
    }
}
