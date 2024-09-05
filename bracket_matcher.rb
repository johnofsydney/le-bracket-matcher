class BracketMatcher
  def self.balanced?(string)
    new.balanced?(string.gsub(/[^(){}\[\]]/, ''))
  end

  def balanced?(string)
    return true if string.empty?

    if first_and_last_brackets_match?(string)
      string = string[1..-2]
      balanced?(string)
    elsif first_and_second_brackets_match?(string)
      string = string[2..-1]
      balanced?(string)
    elsif last_and_second_to_last_brackets_match?(string)
      string = string[0..-3]
      balanced?(string)
    else
      false
    end
  end

  private

  def first_and_second_brackets_match?(string)
    matching_brackets?(string[0], string[1])
  end

  def last_and_second_to_last_brackets_match?(string)
    matching_brackets?(string[-1], string[-2])
  end

  def first_and_last_brackets_match?(string)
    matching_brackets?(string[0], string[-1])
  end

  def matching_brackets?(char_one, char_two)
    char_one == '(' && char_two == ')' ||
      char_one == '[' && char_two == ']' ||
      char_one == '{' && char_two == '}'
  end
end