# @param {String} num1
# @param {String} num2
# @return {String}
def complex_number_multiply(num1, num2)
    parse_complex = ->(s) {
        parts = s.split('+')
        real = parts[0].to_i
        imag = parts[1][0...-1].to_i
        [real, imag]
    }
    
    a, b = parse_complex.call(num1)
    c, d = parse_complex.call(num2)
    real_part = a * c - b * d
    imag_part = a * d + b * c
    real_part.to_s + "+" + imag_part.to_s + "i"
end
