# @param {String} code
# @return {Boolean}
def is_valid(code)
    tag_pat = /^<\/?([A-Z]{1,9})>$/
    open_cdata = "<![CDATA["
    close_cdata = "]]>"
    stack = []
    first_tag_seen = false
    i = 0
    j = code.length - 1
    
    while i <= j + 1
        s = code.index('<', i)
        break if s.nil?
        e = code.index('>', s + 1)
        return false if e.nil?
        
        candidate = code[s..e]
        m = candidate.match(tag_pat)
        
        if m
            tag = m[1]
            
            if candidate[1] != '/'
                if !first_tag_seen && s != 0
                    return false
                end
                stack.push(tag)
                first_tag_seen = true
            else
                return false if stack.empty? || stack.last != tag
                return false if stack.length == 1 && e != code.length - 1
                stack.pop
            end
            
            i = e + 1
        elsif code[s..-1].start_with?(open_cdata)
            k = code.index(close_cdata, s + open_cdata.length)
            return false if k.nil?
            i = k + close_cdata.length
        else
            return false
        end
    end
    
    stack.empty? && first_tag_seen
end
