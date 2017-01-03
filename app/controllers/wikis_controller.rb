class WikisController < ApplicationController
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
  end

  def destroy
  end
end
