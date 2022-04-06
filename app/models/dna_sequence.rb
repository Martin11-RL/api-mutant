class DnaSequence < ApplicationRecord
    enum category: [:human_dna, :mutant_dna]
end
