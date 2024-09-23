
require 'pry'
def validate(key)
  if key.to_s.length > 16 || key.to_s.length < 16
    return false
  end
  # return false unless key.to_s.length > 16

  Array(key).each do |one_key|

    first_two_digits = ['51', '52', '53', '54', '55']
    return false unless first_two_digits.include?(one_key.to_s[0..1])

    string_key = one_key.to_s.chars

    string_key.each_with_index do |num, index|
      if index % 2 == 0
        multiplied = num.to_i * 2
        string_key[index] = multiplied < 10 ? multiplied.to_s : (multiplied / 10 + multiplied % 10).to_s
        string_key.join
      end
    end
    sum = string_key.reduce(0) { |acc, val| acc + val.to_i }
    puts sum
    if sum%10==0
      return true
    end
    # return false unless sum%10==0
  end
end
