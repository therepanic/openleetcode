class Solution {
    func alphabetBoardPath(_ target: String) -> String {
        let arr: [[Int]] = [[0,1,2,3,4],[5,6,7,8,9],[10,11,12,13,14],[15,16,17,18,19],[20,21,22,23,24],[25]]
        let word = target.map { Int($0.asciiValue! - 97) }
        var s = ""
        var j = 0, k = 0
        if word[0] % 5 != 0 {
            s += String(repeating: "D", count: word[0] / 5)
        } else {
            s += String(repeating: "D", count: word[0] / 5)
        }
        if word[0] % 5 >= 0 {
            s += String(repeating: "R", count: word[0] % 5)
        }
        s += "!"
        for i in 1..<word.count {
            for h in 0..<arr.count {
                for l in 0..<arr[h].count {
                    if arr[h][l] == word[i-1] { j = h }
                    if arr[h][l] == word[i] { k = h }
                }
            }
            if word[i-1] == 25 {
                if j > k {
                    s += String(repeating: "U", count: j - k)
                } else {
                    s += String(repeating: "D", count: k - j)
                }
                if word[i] % 5 >= word[i-1] % 5 {
                    s += String(repeating: "R", count: word[i] % 5 - word[i-1] % 5)
                } else {
                    s += String(repeating: "L", count: word[i-1] % 5 - word[i] % 5)
                }
            } else {
                if word[i] % 5 >= word[i-1] % 5 {
                    s += String(repeating: "R", count: word[i] % 5 - word[i-1] % 5)
                } else {
                    s += String(repeating: "L", count: word[i-1] % 5 - word[i] % 5)
                }
                if j > k {
                    s += String(repeating: "U", count: j - k)
                } else {
                    s += String(repeating: "D", count: k - j)
                }
            }
            s += "!"
        }
        return s
    }
}
