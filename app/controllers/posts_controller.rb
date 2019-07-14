class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]      #メソッドをシンボルで呼ぶ。先にしたいことを書く
  #
  def index
    
    #最新記事用
    @new_posts = Post.all.find_newest_article
    #railsのルールとして複数形に必要があるのか
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.attributes = {
      user_id: current_user.id
    }
    if @post.save
    redirect_to user_post_path(current_user, @post), notice: "ブログを登録しました"
    else
      render :new #viewだけを表示するので@postの中身は変わらない
    end
  end

  def show
    
  end

  def edit 
    
    
  end

  def update
    if @post.update(post_params)
      redirect_to user_post_path(current_user, @post), notice: "ブログを更新しました"
    else 
      render :edit
    end
  end
  def destroy
      
      @post.destroy
      redirect_to posts_path, notice: "ブログを削除しました" #post_pathの意味を知りたい

  end
  






  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id) 
  end

  def set_post
    @post = Post.find(params[:id])  
  end
  #なかでしか使わないものはできる限りprivateの中に作っていく。
end
