class ImagesController < ApplicationController
    def index
        images = Image.all
        render json: images
    end

    def show
        image = Image.find(params[:id])
        render json: image
    end

    def create
        image = Image.create(image_params)
        if image.valid?
        render json: { token: token(image.id), image_id: image.id }
        
        else
        render json: { errors: image.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def update
        image = image.find(params[:id])
        if image.update(image_params)
            render json: image.to_json
        else
        render json: image.errors, status: :unprocessable_entity
        end 
        end
    private

    def image_params
        params.require(:image).permit(:character_id)
    end
end
