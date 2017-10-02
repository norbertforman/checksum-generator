class PagesController < ApplicationController
  require 'checksum_generator'

  before_action :authenticate_user!
  before_action :load_checksum, :build_checksum, only: [:submit_checksum_generator]

  private

  def load_checksum
    @cg = ChecksumGenerator.new(params[:content]).generate
  end

  def build_checksum
    number_of = @cg[:number_of]
    @checksum = "#{number_of[:original_words]}-#{number_of[:newly_created_words]}-" +
                "#{number_of[:upper_case_vowels]}-#{number_of[:consonants]}-#{number_of[:original_characters]}"
  end
end
