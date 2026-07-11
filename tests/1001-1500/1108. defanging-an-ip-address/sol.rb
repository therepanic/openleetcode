# @param {String} address
# @return {String}
def defang_i_paddr(address)
    s = ""
    address.each_char do |i|
        if i == "."
            s += "[.]"
        else
            s += i
        end
    end
    s
end
