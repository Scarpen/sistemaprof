class AdminsController < ApplicationController
	load_and_authorize_resource
	def index
		@admin = Admin.all
	end
	def new
		@admin = Admin.new
	end
	def create
		@admin = Admin.new(params[:admin])
		if @admin.save
			redirect_to @admin, :notice => 'Admin Cadastrado'
		else
			render :new
		end
	end
	def show
		@admin = Admin.find(params[:id])
	end

	def edit
		@admin = Admin.find(params[:id])
	end

	def update
		@admin = Admin.find(params[:id])
		if @admin.update_attributes(params[:admin])
			redirect_to @admin, :notice => 'Cadastro atualizado com sucesso'
		else
			render :update
		end
	end
	def destroy
		@admin = Admin.find(params[:id])
		if @admin.destroy
			redirect_to @admin, :notice => 'Cadastro apagado'
		else
			render :index
		end
	end
end
