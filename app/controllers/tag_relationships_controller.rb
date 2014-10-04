class TagRelationshipsController < ApplicationController
  before_action :set_tag_relationship, only: [:show, :edit, :update, :destroy]

  # GET /tag_relationships
  # GET /tag_relationships.json
  def index
    @tag_relationships = TagRelationship.all
  end

  # GET /tag_relationships/1
  # GET /tag_relationships/1.json
  def show
  end

  # GET /tag_relationships/new
  def new
    @tag_relationship = TagRelationship.new
  end

  # GET /tag_relationships/1/edit
  def edit
  end

  # POST /tag_relationships
  # POST /tag_relationships.json
  def create
    @tag_relationship = TagRelationship.new(tag_relationship_params)

    respond_to do |format|
      if @tag_relationship.save
        format.html { redirect_to @tag_relationship, notice: 'Tag relationship was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tag_relationship }
      else
        format.html { render action: 'new' }
        format.json { render json: @tag_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_relationships/1
  # PATCH/PUT /tag_relationships/1.json
  def update
    respond_to do |format|
      if @tag_relationship.update(tag_relationship_params)
        format.html { redirect_to @tag_relationship, notice: 'Tag relationship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_relationships/1
  # DELETE /tag_relationships/1.json
  def destroy
    @tag_relationship.destroy
    respond_to do |format|
      format.html { redirect_to tag_relationships_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_relationship
      @tag_relationship = TagRelationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_relationship_params
      params[:tag_relationship]
    end
end
