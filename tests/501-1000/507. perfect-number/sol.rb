# @param {Integer} num
# @return {Boolean}
def check_perfect_number(num)
    return false if num == 1
    count = 1
    i = 2
    while i <= Math.sqrt(num).to_i
        if num % i == 0
            count += i + num / i
        end
        i += 1
    end
    num == count
end
