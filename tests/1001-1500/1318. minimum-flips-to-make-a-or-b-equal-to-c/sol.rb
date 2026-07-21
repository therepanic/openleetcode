# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {Integer}
def min_flips(a, b, c)
    count = 0
    while a != 0 or b != 0 or c != 0
        abit = a & 1
        bbit = b & 1
        cbit = c & 1

        if cbit == 0
            count += 1 if abit == 1
            count += 1 if bbit == 1
        else
            count += 1 if abit == 0 and bbit == 0
        end

        a >>= 1
        b >>= 1
        c >>= 1
    end
    count
end
