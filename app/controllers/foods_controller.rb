class FoodsController < ApplicationController
  def posts
		@posts = Post.all
  end

  def posts_category
  	case params[:category]
		when "venture"
			@category = "벤처"
		when "DK"
      @category = "대경"
		when "CM"
      @category = "창모"
		when "CH"
      @category = "찬희"
		end
		@posts = Post.where(category: @category)
	end

  def show
  	@post = Post.find(params[:id])
	end

  def write
  end

  def write_complete
  end

  def edit
  end

  def edit_complete
  end

  def delete_complete
  end
end
