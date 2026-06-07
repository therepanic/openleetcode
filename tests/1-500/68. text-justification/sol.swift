class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var res = [String]()
        var i = 0

        while i < words.count {
            var j = i
            var lineLen = 0
            while j < words.count && lineLen + words[j].count + (j - i) <= maxWidth {
                lineLen += words[j].count
                j += 1
            }

            let spaces = maxWidth - lineLen
            let gaps = j - i - 1
            var line = ""

            if j == words.count || gaps == 0 {
                for k in i..<j {
                    if k > i {
                        line += " "
                    }
                    line += words[k]
                }
                line += String(repeating: " ", count: maxWidth - line.count)
            } else {
                let each = spaces / gaps
                var extra = spaces % gaps
                for k in i..<j {
                    line += words[k]
                    if k < j - 1 {
                        let count = each + (extra > 0 ? 1 : 0)
                        line += String(repeating: " ", count: count)
                        if extra > 0 {
                            extra -= 1
                        }
                    }
                }
            }

            res.append(line)
            i = j
        }

        return res
    }
}
