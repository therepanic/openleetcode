# @param {String} s
# @param {Integer[]} answers
# @return {Integer}
def score_of_students(s, answers)
    memo = {}
    
    fn = lambda do |lo, hi|
        return [s[lo].to_i] if lo + 1 == hi
        return memo[[lo, hi]] if memo.key?([lo, hi])
        ans = []
        mid = lo + 1
        while mid < hi
            fn.call(lo, mid).each do |x|
                fn.call(mid + 1, hi).each do |y|
                    if s[mid] == '+' && x + y <= 1000
                        ans << (x + y) unless ans.include?(x + y)
                    elsif s[mid] == '*' && x * y <= 1000
                        ans << (x * y) unless ans.include?(x * y)
                    end
                end
            end
            mid += 2
        end
        memo[[lo, hi]] = ans
    end
    
    target = eval(s)
    cand = fn.call(0, s.length)
    score = 0
    answers.each do |x|
        if x == target
            score += 5
        elsif cand.include?(x)
            score += 2
        end
    end
    score
end
