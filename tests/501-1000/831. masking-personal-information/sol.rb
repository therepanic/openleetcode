# @param {String} s
# @return {String}
def mask_pii(s)
    if s.include?("@")
        name, domain = s.split("@")
        name = name.downcase
        domain = domain.downcase
        name = name[0] + "*****" + name[-1]
        return name + "@" + domain
    else
        gg = ""
        s.each_char do |x|
            if x.match?(/[0-9]/)
                gg += x
            end
        end
        l = gg.length
        if l > 10
            return "+" + "*" * (l - 10) + "-***-***-" + gg[-4..-1]
        end
        return "***-***-" + gg[-4..-1]
    end
end
