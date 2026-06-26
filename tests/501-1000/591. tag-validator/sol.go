import (
	"regexp"
)

func isValid(code string) bool {
    tagPat := regexp.MustCompile(`^<(/?)([A-Z]{1,9})>$`)
    openCdata := "<![CDATA["
    closeCdata := "]]>"
    stack := []string{}
    firstTagSeen := false
    i := 0
    j := len(code)
    
    for i <= j {
        s := strings.Index(code[i:], "<")
        if s == -1 {
            break
        }
        s += i
        e := strings.Index(code[s+1:], ">")
        if e == -1 {
            return false
        }
        e += s + 1
        
        candidate := code[s : e+1]
        m := tagPat.FindStringSubmatch(candidate)
        
        if m != nil {
            tag := m[2]
            
            if m[1] == "" {
                if !firstTagSeen && s != 0 {
                    return false
                }
                stack = append(stack, tag)
                firstTagSeen = true
            } else {
                if len(stack) == 0 || stack[len(stack)-1] != tag {
                    return false
                }
                if len(stack) == 1 && e != len(code)-1 {
                    return false
                }
                stack = stack[:len(stack)-1]
            }
            
            i = e + 1
        } else if strings.HasPrefix(code[s:], openCdata) {
            k := strings.Index(code[s+len(openCdata):], closeCdata)
            if k == -1 {
                return false
            }
            i = s + len(openCdata) + k + len(closeCdata)
        } else {
            return false
        }
    }
    
    return len(stack) == 0 && firstTagSeen
}
