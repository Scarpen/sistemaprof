class DiciplinasController < ApplicationController
  load_and_authorize_resource
  # GET /diciplinas
  # GET /diciplinas.json
  def index
    @diciplinas = Diciplina.all
    @professors = Professor.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diciplinas }
    end
  end

  def atuais
    @diciplinas = Diciplina.all
  end

  # GET /diciplinas/1
  # GET /diciplinas/1.json
  def show
    @diciplina = Diciplina.find(params[:id])
    @professors = Professor.all
    @professor = Professor.find(@diciplina.professor_id)
    @arquivos = []
    Arquivo.all.each do |a|
      if a.diciplina_id == @diciplina.id
        @arquivos << a
      end
    end
  end

  # GET /diciplinas/new
  # GET /diciplinas/new.json
  def new
    @diciplina = Diciplina.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @diciplina }
    end
  end

  # GET /diciplinas/1/edit
  def edit
    @diciplina = Diciplina.find(params[:id])
  end

  # POST /diciplinas
  # POST /diciplinas.json
  def create
    @diciplina = Diciplina.new(params[:diciplina])
    @diciplina.professor_id = current_user.id
    respond_to do |format|
      if @diciplina.save
        format.html { redirect_to @diciplina, notice: 'Diciplina was successfully created.' }
        format.json { render json: @diciplina, status: :created, location: @diciplina }
      else
        format.html { render action: "new" }
        format.json { render json: @diciplina.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /diciplinas/1
  # PUT /diciplinas/1.json
  def update
    @diciplina = Diciplina.find(params[:id])

    respond_to do |format|
      if @diciplina.update_attributes(params[:diciplina])
        format.html { redirect_to @diciplina, notice: 'Diciplina was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @diciplina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diciplinas/1
  # DELETE /diciplinas/1.json
  def destroy
    @diciplina = Diciplina.find(params[:id])
    @diciplina.destroy

    respond_to do |format|
      format.html { redirect_to diciplinas_url }
      format.json { head :no_content }
    end
  end

  def aceitar
    @diciplina = Diciplina.find(params[:diciplina])
    aluno = Aluno.find(params[:aluno])
    disciplina = @diciplina.id
    @diciplina.aceitar(aluno, disciplina)
    redirect_to action: 'show', controller: 'diciplinas', id: disciplina
  end

  def recusar
    @diciplina = Diciplina.find(params[:diciplina])
    aluno = Aluno.find(params[:aluno])
    disciplina = @diciplina.id
    @diciplina.recusar(aluno, disciplina)
    redirect_to action: 'show', controller: 'diciplinas', id: disciplina
  end


end
