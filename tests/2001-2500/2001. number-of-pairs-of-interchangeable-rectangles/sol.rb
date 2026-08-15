# @param {Integer[][]} rectangles
# @return {Integer}
def interchangeable_rectangles(rectangles)
    def gcd(a, b)
        while b != 0
            a, b = b, a % b
        end
        a
    end
    
    ratio_count = Hash.new(0)
    result = 0
    
    rectangles.each do |width, height|
        g = gcd(width, height)
        reduced = [width / g, height / g]
        result += ratio_count[reduced]
        ratio_count[reduced] += 1
    end
    
    result
end
