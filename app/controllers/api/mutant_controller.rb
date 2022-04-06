class Api::MutantController < ApplicationController
    
    def ismutant
        mutant = DnaService.new(mutant_params[:dna]).isMutant    

        if mutant
            render json: {success: true, message: "El Humano es Mutante"}, status: 200    
        else
            render json: {success:false, message: "El Humano no es un Mutante"}, status: 403    
        end  
    end

    def stats
        render json: StadisticService.new.report, status: 200
    end

    private

    def mutant_params
        params.permit(dna:[])
    end
end
