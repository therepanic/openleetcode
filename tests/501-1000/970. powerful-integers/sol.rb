# @param {Integer} x
# @param {Integer} y
# @param {Integer} bound
# @return {Integer[]}
def powerful_integers(x, y, bound)
    result = Set.new
    i = 1

    while i <= bound
        j = 1
        while i + j <= bound
            result.add(i + j)
            break if y == 1
            j *= y
        end
        break if x == 1
        i *= x
    end
    
    result.to_a
end
