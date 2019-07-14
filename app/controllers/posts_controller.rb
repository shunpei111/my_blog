class PostsController < ApplicationController
  def index
    @posts = Post.all
    #最新記事用
    @new_posts = Post.all 
    #railsのルールとして複数形に必要があるのか
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
    redirect_to @post, notice: "ブログを登録しました"
    else
      render :new #viewだけを表示するので@postの中身は変わらない
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit 
    @post = Post.find(params[:id]) #データを持ってこないといけない
    
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "ブログを更新しました"
    else 
      render :edit
    end
  end
  def destroy 
      @post = Post.find(params[:id]) #一件取得することを意味する
      @post.destroy
      redirect_to posts_path, notice: "ブログを削除しました" #post_pathの意味を知りたい

  end
  






  private

  def post_params
    params.require(:post).permit(:title, :body) 
  end
end
