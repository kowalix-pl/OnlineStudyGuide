class CodeSnippetsController < ApplicationController
  before_action :set_language
  before_action :authenticate_user!
  before_action :set_code_snippet, only: [:show, :edit, :update, :destroy]

  # GET /code_snippets
  # GET /code_snippets.json
  def index
    @code_snippets = @language.code_snippets
  end

  # GET /code_snippets/1
  # GET /code_snippets/1.json
  def show
  end

  # GET /code_snippets/new
  def new
    @code_snippet = @language.code_snippets.new
  end

  # GET /code_snippets/1/edit
  def edit
  end

  # POST /code_snippets
  # POST /code_snippets.json
  def create
    @code_snippet = @language.code_snippets.new(code_snippet_params)

    respond_to do |format|
      if @code_snippet.save
        format.html { redirect_to [@language,@code_snippet], notice: 'Code snippet was successfully created.' }
        format.json { render :show, status: :created, location: @code_snippet }
      else
        format.html { render :new }
        format.json { render json: @code_snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /code_snippets/1
  # PATCH/PUT /code_snippets/1.json
  def update
    respond_to do |format|
      if @code_snippet.update(code_snippet_params)
        format.html { redirect_to [@language,@code_snippet], notice: 'Code snippet was successfully updated.' }
        format.json { render :show, status: :ok, location: @code_snippet }
      else
        format.html { render :edit }
        format.json { render json: @code_snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /code_snippets/1
  # DELETE /code_snippets/1.json
  def destroy
    @code_snippet.destroy
    respond_to do |format|
      format.html { redirect_to language_code_snippets_url(@language), notice: 'Code snippet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_code_snippet
      @code_snippet = @language.code_snippets.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def code_snippet_params
      params.require(:code_snippet).permit(:code)
    end

   # Use callbacks to share common setup or constraints between actions.
    def set_language
      @language = current_user.languages.find(params[:language_id])
    end

end
