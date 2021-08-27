class DashboardController < ApplicationController
  def index
    @attempted_products = ApiLog.sum(:quantity)
    @valid_products = Product.count

    @title = I18n.t('dashboard.title')
  end
end
