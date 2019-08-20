class Dashboard::HomeController < DashboardController
  def index
    @lawsuits = Lawsuit.all
  end
end
