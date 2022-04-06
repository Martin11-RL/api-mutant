class DnaService
    def initialize(dna)
        @dna = dna
        @secuences_mutant = []
        @permit_dna = ["A", "T", "C", "G"]        
    end

    def isMutant
        raise Exception.new("Los valores no son validos") unless is_valid?
        chars_vertical()
        chars_horizontal()
        chars_diagonal_right()
        chars_diagonal_left()
        DnaSequence.create({dna: @dna, category: @secuences_mutant.length >= 3 ? :mutant_dna : :human_dna}) if DnaSequence.where(dna: @dna).empty?        
        return @secuences_mutant.length >= 3
    end

    def is_valid?
        valid = @dna.join.chars.uniq.concat(@permit_dna).uniq
        return valid.length == @permit_dna.length
    end

    def chars_vertical(vertical_str = [])
        begin
            vertical_str = @dna.map {|m| m.chars}.transpose 
        rescue IndexError => e
            raise Exception.new("El arreglo debe ser simétrico")
        end
        verif_dna(vertical_str.map { |i| i.join })
    end

    def chars_horizontal
        verif_dna(@dna)
    end    

    def chars_diagonal_right
        verif_dna(chars_oblique(@dna.map {|m| m.chars}))        
    end

    def chars_diagonal_left
        verif_dna(chars_oblique(@dna.map {|m| m.chars}.reverse))
    end

    def chars_oblique(dna, diagonal_chars = [])                 
        i = 1
        while i > 0
            array = []
            i.times { |x| array.push(dna[x].shift) }
            array.join.empty? ? break : diagonal_chars.push(array.join)
            i = diagonal_chars.length >= dna.length ? i : i + 1            
        end
        return diagonal_chars
    end
    
    def verif_dna(dna)
        dna.each do |dna|
            secuences = dna.chars.uniq.map { |str| str*4 }
            secuences = secuences.map { |sec| dna.scan(sec) }
            @secuences_mutant.push(secuences.join) unless secuences.join.empty?
        end
    end
end