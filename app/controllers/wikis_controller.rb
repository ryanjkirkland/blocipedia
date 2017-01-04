class WikisController < ApplicationController

  before_action :authorize_user, except: [:index, :show, :edit, :update, :new, :create]

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "It's lit fam."
      redirect_to @wiki
    else
      flash[:alert] = "This is WRONG"
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "Ya update was saved, bruh."
      redirect_to @wiki
    else
      flash[:alert] = "Nope."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "IT'S GONE. IT'S ALL GONE."
      redirect_to wikis_path
    else
      flash[:alert] = "WE CANNOT BE DESTROYED"
      render :show
    end
  end

  def authorize_user
    unless current_user.admin?
      flash[:alert] = "YOU CAN'T DO THAT"
      redirect_to wikis_path
    end
  end
end
