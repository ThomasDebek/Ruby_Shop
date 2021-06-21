class BrandPresenter
  def self.select_params
    Brand.pluck :name, :id
  end
end