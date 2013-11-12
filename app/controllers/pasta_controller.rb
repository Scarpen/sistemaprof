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
end
