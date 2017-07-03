module Dashboard
  class HouseRepsController < DashboardController 

    def index
        @house_rep = House_Rep.find(params[:id])
    end

    def show
        @house_rep = House_Rep.find(params[:id])
    end

    def edit
        @house_rep = HouseRep.find(params[:id])
    end

    def update
    end

    private

  end
end