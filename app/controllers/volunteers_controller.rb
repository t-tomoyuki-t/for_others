class VolunteersController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def index
        @search_params = volunteer_search_params
        @volunteers = Volunteer.search(@search_params).includes(:user)
    end


    def new
        @volunteer = Volunteer.new
    end


    def create
        @volunteer = Volunteer.new(volunteer_params)
        
        @volunteer.user_id = current_user.id

        if @volunteer.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show 
        @volunteer = Volunteer.find(params[:id])

        
    end

    def edit
        @volunteer = Volunteer.find(params[:id])
    end

    def update
        volunteer = Volunteer.find(params[:id])
        if volunteer.update(volunteer_params)
          redirect_to :action => "show", :id => volunteer.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        volunteer = Volunteer.find(params[:id])
        volunteer.destroy
        redirect_to action: :index
    end

    private
    def volunteer_params
        params.require(:volunteer).permit(:title, :do_on, :area, :gender, :from_area, :text)
    end

    def volunteer_search_params
        params.fetch(:search, {}).permit(:do_from, :do_to, :area)
    end


end
