module Dashboard
  class HouseRepsController < DashboardController 

    def index
        @house_rep = HouseRep.find(params[:id])
    end

    def show
        @house_rep = HouseRep.find(params[:id])
    end

    def edit
        @house_rep = HouseRep.find(params[:id])
    end

    def update
        @house_rep = HouseRep.find(params[:id])
        if @house_rep.update_attributes(rep_params)
            flash[:success] = "Successfully updated information!"
            redirect_to dashboard_house_rep_path
        else
            render 'edit'
        end
    end

    private
      
      def rep_params
          params.require(:house_rep).permit(:first_name, :last_name, :middle_name,
              :district, :party, :term_start_date, :term_end_date, :terms_served, :dob, :gender, :phone, :website_url, :twitter_account, :facebook_account, :propublica_id, :began_office_at, :ended_office_at, :reelection_date)
      end

  end
end