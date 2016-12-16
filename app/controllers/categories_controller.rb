class CategoriesController < ApplicationController
	before_filter :is_login?

def index
@categories = current_user.categories.where("ancestry is null")
end
	def new
  @category = Category.new
   respond_format

	end

	def create
		  @categories = current_user.categories
	  @category = Category.new(new_params.merge(:user_id => current_user.id))
	 if @category.save
	  	  if remotipart_submitted?
        respond_format
      end
		 end
	end

def child_category
    @category = Category.find(params[:id])
    @childcategory = Category.new
  end

  def create_child_category
    @category = Category.find(params[:id])

    @childcategory = Category.new(new_params.merge(:user_id => current_user.id))

  	if @childcategory.save
      if remotipart_submitted?
        respond_format
      end
  	end
  end

	def show
	  @category = Category.find(params[:id])
	  @notes = Note.where(category_id: @category.subtree_ids)
	  @categories = [@category]
	end

	private

	def new_params
	  params.require(:category).permit!
	end
end
