class Api::PetsController < Api::BaseController

  class Pet < ::Pet
    def serializable_hash(options = {})
      super only: [:name],
            methods: [:years, :ratio_win],
            include: {
                user: {only: :name},
                sex: {only: :name},
                pet_type: {only: :name}
      }
    end
  end

  before_filter :require_owner_pet!, only: [:update, :destroy]
  #Set current_user to pet
  before_filter :set_user_id, only: [:create, :update]

  caches :index, :show, cache_for: 5.minutes

  def index
    expose Pet.paginate(page: params[:page])
  end

  def show
    expose pet
  end

  def create
    expose Pet.create(pet_params)
  end

  def update
    pet.update_attributes(pet_params)
    expose pet
  end

  def destroy
    expose pet.destroy
  end

  protected

    def pet
      @pet ||= Pet.find_by_id(params[:id])
    end

    def require_owner_pet!
      error! :unauthenticated if current_user.id != pet.try(:user_id)
    end

  private

    def pet_params
      params.require(:pet).permit(:name, :birthdate, :user_id, :pet_type_id, :sex_id)
    end

    def set_user_id
      params[:pet] ||= {}
      params[:pet][:user_id] = current_user.id
    end

end