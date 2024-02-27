module Api
    module V1
        class CategoriesController <ApplicationController
            before_action :set_category, only: [ :show, :update, :destroy ]


            def index
                categories = Category.all.order(:id)

                render json: CategorySerializer.new(categories, options)
            end

            def show
                render json: CategorySerializer.new(@category, options)
            end

            def create
                category = Category.new(category_params)
                
                if category.save
                    render json: CategorySerializer.new(category)
                else
                    render json: { error: category.errors.messages }
                end
            end

            def update
                if @category.update(category_params)
                    render json: CategorySerializer.new(@category, options)
                else
                    render json: { error: @category.errors.messages }
                end

            end

            def destroy
                if @category.destroy
                    head :no_content
                else
                    render json: { error: @category.errors.messages }
                end

            end

            private

            def set_category
                @category = Category.find(params[:id])
            end

            def category_params
                params.require(:category).permit(:title, :description, :user_id, :image_url)
            end
        
            def options
                @options ||= { include: [:tasks]}
            end
            
        end
    end
end