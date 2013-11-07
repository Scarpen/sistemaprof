class ControlesController < ApplicationController
	def cadastro
		@user = Aluno.find(params[:user])
		@diciplina = Diciplina.find(params[:disciplina])
		disciplina = @diciplina.id
		us = @user.id
		@controle = Controle.new
		@controle.aluno_id = us
		@controle.diciplina_id = disciplina
		@controle.situacao = 1
		@controle.save
		redirect_to action: 'index', controller: 'diciplinas'
	end
end
