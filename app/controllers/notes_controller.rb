class NotesController < ApplicationController

 before_filter :is_login?

  def index
  	@notes = current_user.notes.where("ancestry is null").includes(:category)
        if params[:search]
       @notes = Note.search(params[:search]).order("created_at DESC")
    else
       @notes = Note.all.order('created_at DESC')
    end
    @categories = Category.where(id: [1, 2, 3])
  end

  def new
  	@note = Note.new
    respond_format
  end

  def create
    @notes = current_user.notes
  	@note = Note.new(new_params.merge(:user_id => current_user.id))
  	if @note.save
      if remotipart_submitted?
        respond_format
      end
  	end
  end

  def show
    @note = Note.find(params[:id])
    @notes = Note.where("ancestry = #{@note.id}")
    @categories = Category.where(id: [@note.category.id])
  end

  def child_note
    @note = Note.find(params[:id])
    @childnote = Note.new
end

  def create_child_note
    @note = Note.find(params[:id])
    @childnote = Note.new(new_params.merge(:user_id => current_user.id))
  	if @childnote.save
      if remotipart_submitted?
          respond_format
      end
  	end
  end

  def edit
  	@note = Note.find(params[:id])
    @categories = Category.where(id: [@note.category.id])
  end

  def update
    @note = Note.find(params[:id])
    if params["note"]["category"]
      @note.category_id = Category.find_by_name(params["note"]["category"]).try(:id)
    end
    params[:note].delete :category
  	if @note.update_attributes(new_params)
  		render json: @note
  	end
  end

  def destroy
  	@note = Note.find(params[:id])
  	@note.destroy
  	redirect_to notes_path
  end

  private

  def new_params
  	params.require(:note).permit!
  end

end
