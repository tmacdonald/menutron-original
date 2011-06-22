class Menu < ActiveRecord::Base
  validates_presence_of :name, :user_id

  has_many :recipes, :class_name => "MenuRecipe", :dependent => :destroy
  has_many :ingredients, :class_name => "MenuIngredient", :dependent => :destroy
  has_many :meals, :dependent => :destroy
  has_many :groceries, :dependent => :destroy
  belongs_to :user

  accepts_nested_attributes_for :recipes, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :meals, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :groceries, :reject_if => :all_blank, :allow_destroy => true

  scope :newest, order("menus.created_at DESC")
  scope :includes_meals, includes(:meals => [:ingredients => [:ingredient, :measurement], :recipes => :recipe])
  scope :includes_all, includes(:ingredients => [:ingredient, :measurement], :recipes => [:recipe], :groceries => [:ingredient, :measurement])

  def as_json(options = nil)
    super( {:except => [:created_at,:updated_at], :include => { :ingredients => { :only => :id, :methods => [:ingredient_name,:how_much] }, :recipes => { :only => [:id,:name,:servings,:slug], :include => :recipe }, :groceries => { :only => :id, :methods => [:ingredient_name,:how_much] } } } )
  end
end
