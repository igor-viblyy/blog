class BlogNamesController < ApplicationController
  def index
    run BlogName::Index
    render cell(BlogName::Cell::Index, result["model"])
  end

  def show
    run BlogName::Show
    render cell(BlogName::Cell::Show, result["model"])
  end

  def new
    run BlogName::Create::Present
    render cell(BlogName::Cell::New, @form)
  end

  def create
    run BlogName::Create do |result|
      return redirect_to blog_names_path
    end

    render cell(BlogName::Cell::New, @form)
  end

  def edit
    run BlogName::Update::Present
    render cell(BlogName::Cell::Edit, @form)
  end

  def update
    run BlogName::Update do |result|
      flash[:notice] = "#{result["model"].name} has been updated"
      return redirect_to blog_name_path(result["model"].id)
    end

    render cell(BlogName::Cell::Edit, @form)
  end

  def destroy
    run BlogName::Delete
    flash[:alert] = "Blog deleting"
    redirect_to blog_names_path
  end
end
