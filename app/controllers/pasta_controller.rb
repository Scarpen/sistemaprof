class PastaController < ApplicationController
	def new

	end

	def destroy
		@pasta = Pasta.find(params[:id])
		id = @pasta.diciplina_id
		if @pasta.destroy
			redirect_to action: 'materiais', controller: 'diciplinas', id: id
		else
		end
	end
	def editar
    	@pasta = Pasta.find(params[:id])
    	@pasta.update_attributes(:nome => params[:n])
    	redirect_to action: 'materiais', controller: 'diciplinas', id: @pasta.diciplina_id
  	end
end
