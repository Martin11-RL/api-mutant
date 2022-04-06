class StadisticService
    def report
        query = "SELECT (SELECT COUNT(*) FROM dna_sequences WHERE category=1) as mutants_dna, (SELECT COUNT(*) FROM dna_sequences WHERE category=0) as humans_dna limit 1"
        data = ActiveRecord::Base.connection.execute(query).to_a.first
        ratio = data["mutants_dna"].to_i / data["humans_dna"].to_f unless data["humans_dna"].to_i == 0
        return {count_mutant_dna: data["mutants_dna"], count_human_dna: data["humans_dna"], ratio: ratio ||= 0 }
    end
end