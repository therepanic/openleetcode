# @param {String} expression
# @return {Boolean}
def parse_bool_expr(expression)
    st = [[]]
    expression.each_char do |ch|
        if ch == '&'
            st << [->(a) { a.all? }]
        elsif ch == '|'
            st << [->(a) { a.any? }]
        elsif ch == '!'
            st << [->(a) { !a[0] }]
        elsif ch == 't'
            st[-1] << true
        elsif ch == 'f'
            st[-1] << false
        elsif ch == ')'
            op, *args = st.pop
            st[-1] << op.call(args)
        end
    end
    st[0][0]
end
