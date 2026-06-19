import (
    "strconv"
)

func validIPAddress(queryIP string) string {
    if strings.Count(queryIP, ".") == 3 {
        parts := strings.Split(queryIP, ".")
        valid := true
        for _, p := range parts {
            if len(p) == 0 {
                valid = false
                break
            }
            for _, c := range p {
                if c < '0' || c > '9' {
                    valid = false
                    break
                }
            }
            if !valid {
                break
            }
            num, err := strconv.Atoi(p)
            if err != nil || num < 0 || num > 255 || strconv.Itoa(num) != p {
                valid = false
                break
            }
        }
        if valid {
            return "IPv4"
        }
    } else if strings.Count(queryIP, ":") == 7 {
        parts := strings.Split(queryIP, ":")
        valid := true
        for _, p := range parts {
            if len(p) < 1 || len(p) > 4 {
                valid = false
                break
            }
            for _, c := range p {
                if !((c >= '0' && c <= '9') || (c >= 'a' && c <= 'f') || (c >= 'A' && c <= 'F')) {
                    valid = false
                    break
                }
            }
            if !valid {
                break
            }
        }
        if valid {
            return "IPv6"
        }
    }
    return "Neither"
}
