class PetsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.all
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = current_user.pets.build
  end

  # GET /pets/1/edit
  def edit
    respond_to do |format|
      if @pet.user != current_user
        format.html { redirect_to @pet, notice: 'Cannot edit because you are not the owner.' }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /pets
  # POST /pets.json
  def create
   @pet = current_user.pets.build(pet_params)

   respond_to do |format|
     if @pet.save
       format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
       format.json { render :show, status: :created, location: @pet }
     else
       format.html { render :new }
       format.json { render json: @pet.errors, status: :unprocessable_entity }
     end
    end
 end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.user != current_user
        #redirect_to root_path
        format.html { redirect_to @pet, notice: 'Cannot edit because you are not the owner.' }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    respond_to do |format|
      if @pet.user != current_user
        format.html { redirect_to @pet, notice: 'Cannot destroy because you are notthe owner.' }
      else
          @pet.destroy
          format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
          format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :birthday, :sex, :category)
    end
end
