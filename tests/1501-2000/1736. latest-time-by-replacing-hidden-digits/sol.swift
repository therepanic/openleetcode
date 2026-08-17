class Solution {
    func maximumTime(_ time: String) -> String {
        var ret = ""
        let chars = Array(time)
        for i in 0..<chars.count {
            let c = chars[i]
            if c == "?" {
                if i == 0 {
                    if chars[i+1] == "?" {
                        ret += "2"
                    } else if ["0","1","2","3"].contains(String(chars[i+1])) {
                        ret += "2"
                    } else {
                        ret += "1"
                    }
                } else if i == 1 {
                    if chars[i-1] == "?" {
                        ret += "3"
                    } else if chars[i-1] == "0" || chars[i-1] == "1" {
                        ret += "9"
                    } else {
                        ret += "3"
                    }
                } else if i == 3 {
                    ret += "5"
                } else if i == 4 {
                    ret += "9"
                }
            } else {
                ret += String(c)
            }
        }
        return ret
    }
}
