class Dashboard::HomeController < DashboardController
  def index
    @lawsuits = Dashboard::Lawsuit.all
  end
end
