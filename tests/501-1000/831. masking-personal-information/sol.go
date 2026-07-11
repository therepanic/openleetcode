func maskPII(s string) string {
    if strings.Contains(s, "@") {
        parts := strings.Split(s, "@")
        name := strings.ToLower(parts[0])
        domain := strings.ToLower(parts[1])
        name = string(name[0]) + "*****" + string(name[len(name)-1])
        return name + "@" + domain
    } else {
        gg := ""
        for _, x := range s {
            if x >= '0' && x <= '9' {
                gg += string(x)
            }
        }
        l := len(gg)
        if l > 10 {
            return "+" + strings.Repeat("*", l-10) + "-***-***-" + gg[l-4:]
        }
        return "***-***-" + gg[l-4:]
    }
}
