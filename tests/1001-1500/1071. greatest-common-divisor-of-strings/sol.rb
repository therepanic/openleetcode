# @param {String} str1
# @param {String} str2
# @return {String}
def gcd_of_strings(str1, str2)
    return "" if str1 + str2 != str2 + str1
    
    def gcd(len1, len2)
        min_val = [len1, len2].min
        min_val.downto(1) do |i|
            return i if len1 % i == 0 && len2 % i == 0
        end
        1
    end
    
    str1[0, gcd(str1.length, str2.length)]
end
