class ContentsController < ApplicationController
    before_action :authenticate_user!
    include Devise::Controllers::Helpers 

    def index
        @contents = current_user.contents
    end

    def new
        @content = Content.new
    end

    def edit
        @content = Content.find(params[:id])
    end

    def create
        @content = current_user.contents.build(content_params)
        if @content.save
            redirect_to contents_path, notice: 'Content successfully created!'
        else
            render :new
        end
    end
    
    private
    def content_params
        params.require(:content).permit(:title, :description)
    end
    
end
  