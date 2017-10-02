require 'spec_helper'
require 'checksum_generator'

describe ChecksumGenerator do
  describe '.generate' do
    cg = ChecksumGenerator.new('').generate
    it 'empty hash' do
      expect(cg).to eq({})
    end
  end
end
