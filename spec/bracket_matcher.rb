# FROZEN_STRING_LITERAL: true

require_relative '../bracket_matcher'

RSpec.describe BracketMatcher do
  describe '.balanced?' do
    context 'these ones work' do
      it { expect(BracketMatcher.balanced?('')).to be true }
      it { expect(BracketMatcher.balanced?('abc')).to be true }

      it { expect(BracketMatcher.balanced?('()')).to be true }
      it { expect(BracketMatcher.balanced?('()[]')).to be true }
      it { expect(BracketMatcher.balanced?('()[]{}')).to be true }
      it { expect(BracketMatcher.balanced?('()[{}]')).to be true }
    end

    context 'this one doesnt work' do
      it { expect(BracketMatcher.balanced?('[{}]()[{}]')).to be true }
    end
  end
end
