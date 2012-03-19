class ProjetosController < ApplicationController
	before_filter :authenticate_usuario!
	respond_to :html, :json
	
  def index
    @projetos = Projeto.all
		respond_with(@projetos)
  end

  def show
    @projeto = Projeto.find(params[:id])
		respond_with(@projeto)
  end

  def new

    @projeto = Projeto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @projeto }
    end
  end

  def edit
    @projeto = Projeto.find(params[:id])
  end

  def create
    @projeto = Projeto.new(params[:projeto])
		@projeto.usuario_id = current_usuario.id
    respond_to do |format|
      if @projeto.save
        format.html { redirect_to @projeto, notice: 'projeto foi criado com sucesso.' }
        format.json { render json: @projeto, status: :created, location: @projeto }
      else
        format.html { render action: "new" }
        format.json { render json: @projeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projetos/1
  # PUT /projetos/1.json
  def update
    @projeto = Projeto.find(params[:id])
		@projeto.usuario_id = current_usuario.id

    respond_to do |format|
      if @projeto.update_attributes(params[:projeto])
        format.html { redirect_to @projeto, notice: 'Projeto was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @projeto.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @projeto = Projeto.find(params[:id])
    @projeto.destroy

    respond_to do |format|
      format.html { redirect_to projetos_url }
      format.json { head :ok }
    end
  end
end
