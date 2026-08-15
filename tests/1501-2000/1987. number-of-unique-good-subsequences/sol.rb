# @param {String} binary
# @return {Integer}
def number_of_unique_good_subsequences(binary)
    a = 0
    b = 0
    z = 0
    binary.each_char do |c|
        if c == '1'
            b = (a + b + 1) % (10**9 + 7)
        else
            a = (a + b) % (10**9 + 7)
            z = 1
        end
    end
    (a + b + z) % (10**9 + 7)
end
