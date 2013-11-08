class ArquivosController < ApplicationController
	def new
		@arquivo = Arquivo.new
		@diciplinas = []
		Diciplina.all.each do |d|
			if d.professor_id == current_user.id
				 @diciplinas << d 
			end
		end 
	end
	def create
		@arquivo = Arquivo.new(params[:arquivo])


		if @arquivo.save
			redirect_to @arquivo, notice: "Arquivo Enviado com sucesso"
		end
	end
	def show
		@arquivo = Arquivo.find(params[:id])
	end
	def destroy
		@arquivo = Arquivo.find(params[:id])
		id = @arquivo.pasta_id
		if @arquivo.destroy
			redirect_to action: 'show', controller: 'diciplinas', id: id
		else
		end
	end



	def download
		@arquivo = Arquivo.find(params[:meuar])
		urlcomplete = "#{Rails.root}/public" << @arquivo.arquivo.url
		send_file urlcomplete
	end

	def index
	@arquivo = Arquivo.all
  	end

end
