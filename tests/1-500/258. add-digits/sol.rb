# @param {Integer} num
# @return {Integer}
def add_digits(num)
    if num == 0
        return 0
    end
    if num % 9 == 0
        return 9
    else
        return num % 9
    end
end
