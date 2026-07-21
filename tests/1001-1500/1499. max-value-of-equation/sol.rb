# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer}
def find_max_value_of_equation(points, k)
    window = []
    answer = -10**30
    points.each do |x, y|
        while !window.empty? && x - window[0][1] > k
            window.shift
        end
        if !window.empty?
            answer = [answer, x + y + window[0][0]].max
        end
        value = y - x
        while !window.empty? && window[-1][0] <= value
            window.pop
        end
        window << [value, x]
    end
    answer
end
