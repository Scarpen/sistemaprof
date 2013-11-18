class AlunosController < ApplicationController
	load_and_authorize_resource
	def index
		@aluno = Aluno.all
	end
	def new
		@aluno = Aluno.new
	end
	def create
		@aluno = Aluno.new(params[:aluno])
		if @aluno.save
			redirect_to @aluno, :notice => 'Aluno Cadastrado'
		else
			render :new
		end
	end
	def show
		@aluno = Aluno.find(params[:id])
	end

	def edit
		@aluno = Aluno.find(params[:id])
	end

	def update
		@aluno = Aluno.find(params[:id])
		if @aluno.update_attributes(params[:aluno])
			redirect_to @aluno, :notice => 'Cadastro atualizado com sucesso'
		else
			render :update
		end
	end
	def destroy
		@aluno = Aluno.find(params[:id])
		if @aluno.destroy
			redirect_to @aluno, :notice => 'Cadastro apagado'
		else
			render :index
		end
	end
end
