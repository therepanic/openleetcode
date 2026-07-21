# @param {Integer[][]} mat
# @return {Integer}
def num_submat(mat)
  r = mat.length
  c = mat[0].length
  h = Array.new(c, 0)
  ans = 0
  
  (0...r).each do |i|
    (0...c).each do |j|
      h[j] = mat[i][j] == 1 ? h[j] + 1 : 0
    end
    
    sumv = Array.new(c, 0)
    st = []
    
    (0...c).each do |j|
      while !st.empty? && h[st[-1]] >= h[j]
        st.pop
      end
      
      if !st.empty?
        p = st[-1]
        sumv[j] = sumv[p] + h[j] * (j - p)
      else
        sumv[j] = h[j] * (j + 1)
      end
      
      st.push(j)
      ans += sumv[j]
    end
  end
  
  ans
end
