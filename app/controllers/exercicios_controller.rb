class ExerciciosController < ApplicationController
	def new
		@exercicio = Exercicio.new
	end
	def create

		@exercicio = Exercicio.new(params[:exercicio])
		Exercicio.all.each do |e|
			if e.aluno_id == @exercicio.aluno_id && e.atividade_id == @exercicio.atividade_id
				e.destroy
			end
		end
		id = @exercicio.atividade.diciplina.id
		if @exercicio.save
			redirect_to action: 'atividades', controller: 'diciplinas', id: id, notice: "Atividade Enviada com sucesso"

		end
	end


	def show
		@exercicio = Exercicio.find(params[:id])
	end
	def destroy
		@exercicio = Exercicio.find(params[:id])
		id = @exercicio.atividade_id
		atividade = atividade.find(id)
		id = atividade.diciplina_id
		if @exercicio.destroy
			redirect_to action: 'materiais', controller: 'diciplinas', id: id
		else
		end
	end

	def download
		exercicio = Exercicio.find(params[:meuar])
		urlcomplete = "#{Rails.root}/public" << exercicio.arquivo.url
		send_file urlcomplete
	end

	def atribuirnota
		@exercicio = Exercicio.find(params[:id]);
		@exercicio.update_attributes(:nota => params[:nota])
		redirect_to action: 'atividades', controller: 'diciplinas', id: @exercicio.atividade.diciplina_id, notice: "Nota atribuida com sucesso"
	end
end
