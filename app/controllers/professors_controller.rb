class ProfessorsController < ApplicationController
	load_and_authorize_resource
	def index
		@professor = Professor.all
	end
	def new
		@professor = Professor.new
	end
	def create
		@professor = Professor.new(params[:professor])
		if @professor.save
			redirect_to @professor, :notice => 'Professor Cadastrado'
			
		else
			render :new
		end
	end
	def show
		@professor = Professor.find(params[:id])
	end

	def edit
		@professor = Professor.find(params[:id])
	end

	def update
		@professor = Professor.find(params[:id])
		if @professor.update_attributes(params[:professor])
			redirect_to @professor, :notice => 'Cadastro atualizado com sucesso'
		else
			render :update
		end
	end
	def destroy
		@professor = Professor.find(params[:id])
		if @professor.destroy
			redirect_to @professor, :notice => 'Cadastro apagado'
		else
			render :index
		end
	end
end
