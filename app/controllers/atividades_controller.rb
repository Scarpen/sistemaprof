class AtividadesController < ApplicationController
	load_and_authorize_resource
	def new

	end
	def create
		print 'teste'
		@atividade = Atividade.new(params[:atividade])
		id = @atividade.diciplina.id

		if @atividade.save
			redirect_to action: 'atividades', controller: 'diciplinas', id: id, notice: "Atividade criada com sucesso"

		end
	end

	def destroy
		@atividade = Atividade.find(params[:id])
		id = @atividade.diciplina_id
		if @atividade.destroy
			redirect_to action: 'atividades', controller: 'diciplinas', id: id
		else
		end
	end

end
