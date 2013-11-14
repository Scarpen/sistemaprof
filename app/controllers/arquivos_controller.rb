class ArquivosController < ApplicationController
	load_and_authorize_resource
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
		id = @arquivo.pasta.diciplina.id

		if @arquivo.save
			redirect_to action: 'materiais', controller: 'diciplinas', id: id, notice: "Arquivo Enviado com sucesso"

		end
	end


  # def createarquivo
   
  #   @arquivo = Arquivo.new(params[:arquivo])
  #   @arquivo.pasta_id = params[:pasta_id]
  #   @pasta.diciplina_id = @diciplina.id
  #   @arquivo.save
    
  # end


	def show
		@arquivo = Arquivo.find(params[:id])
	end
	def destroy
		@arquivo = Arquivo.find(params[:id])
		id = @arquivo.pasta_id
		pasta = Pasta.find(id)
		id = pasta.diciplina_id
		if @arquivo.destroy
			redirect_to action: 'materiais', controller: 'diciplinas', id: id
		else
		end
	end



	def download
		arquivo = Arquivo.find(params[:meuar])
		urlcomplete = "#{Rails.root}/public" << arquivo.arquivo.url
		send_file urlcomplete
	end


end
