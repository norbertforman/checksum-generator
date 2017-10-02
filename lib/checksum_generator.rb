class ChecksumGenerator

  VOWELS = 'aeiuoAEIOU'
  CONSONANTS = 'bcdfghjklmnpqrstvwxyz'

  def initialize(content)
    @content = clean_content(content)
    @new_content = populate_new_content
  end

  def generate
    {
      number_of: {
        original_words: count_of_original_words,
        original_characters: length_of_original_content,
        newly_created_words: count_of_newly_created_words,
        upper_case_vowels: count_of_upper_case_vowels,
        consonants: count_of_consonants
      }
    }
  end

  private

  # strip content of unnecessary characters
  def clean_content(content)
    content.gsub(/[^a-zA-Z ]/, '').squeeze(' ').downcase
  end

  def count_of_original_words
    @content.split.size
  end

  def length_of_original_content
    @content.size
  end

  def populate_new_content
    @content.gsub(' ', '').scan(/.{1,10}/)
  end

  def count_of_newly_created_words
    @new_content.size
  end

  def count_of_consonants
    @content.scan(/[#{CONSONANTS}]/).size
  end

  # capitalize the new content
  # split the word that it should always start with a vowel
  # loop through the string and count vovwels that are upcase or are after a vowel with an upcase
  def count_of_upper_case_vowels
    strings = @new_content.map(&:capitalize).join.scan(/[#{VOWELS}][^#{VOWELS}]*/)
    total = 0

    (1..strings.size - 1).each do |index|
      prev_string = strings[index - 1]
      next unless prev_string.match(/[#{CONSONANTS.upcase}]/).nil?
      char = strings[index][0]
      next unless capitalized?(char) || (capitalized?(prev_string[0]) && prev_string.size > 2)
      total += 1
      strings[index][0] = char.upcase
    end
    total
  end

  def capitalized?(char)
    char == char.upcase
  end
end
