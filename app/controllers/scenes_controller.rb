class ScenesController < ApplicationController
    def index
        scenes = Scene.all
        render json: scenes
    end

    def show
        scene = Scene.find(params[:id])
        render json: scene
    end

    def create
        scene = Scene.create(scene_params)
        if scene.valid?
        render json: { token: token(scene.id), scene_id: scene.id }
        
        else
        render json: { errors: scene.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def update
        scene = Scene.find(params[:id])
        if scene.update(scene_params)
            render json: scene.to_json
        else
        render json: scene.errors, status: :unprocessable_entity
        end 
        end
    private

    def scene_params
        params.require(:scene).permit(:plot_id, :name, :summary)
    end
end
