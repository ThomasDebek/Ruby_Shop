class CategoryPresenter
  def self.select_params
    Category.pluck :name, :id
  end
end