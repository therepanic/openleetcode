# @param {Integer} n
# @return {String}
def generate_the_string(n)
    if n % 2 == 1
        "a" * n
    else
        "a" * (n - 1) + "b"
    end
end
