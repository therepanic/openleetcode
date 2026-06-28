# @param {Integer} num
# @return {String}
def convert_to_base7(num)
    if num == 0
        return "0"
    end
    sign = num < 0 ? "-" : ""
    num = num.abs
    result = ""
    while num > 0
        result = (num % 7).to_s + result
        num /= 7
    end
    sign + result
end
