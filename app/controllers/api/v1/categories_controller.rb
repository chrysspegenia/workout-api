module Api
    module V1
        class CategoriesController <ApplicationController
            def index
                categories = Category.all

                render json: CategorySerializer.new(categories)
            end

            def show
                category = Category.find(params[:id])

                render json: CategorySerializer.new(category)
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
                category = Category.find(params[:id])
                
                if category.update(category_params)
                    render json: CategorySerializer.new(category)
                else
                    render json: { error: category.errors.messages }
                end

            end

            
            def destroy
                category = Category.find(params[:id])
                
                if category.destroy
                    head :no_content
                else
                    render json: { error: category.errors.messages }
                end

            end

            private

            def category_params
                params.require(:category).permit(:title, :description, :user_id)
            end
        
            
        end
    end
end