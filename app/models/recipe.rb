class Recipe < ActiveRecord::Base
  default_scope order("name ASC")
  scope :includes_all, includes( :ingredients => [:ingredient,:measurement], :directions => {} )

  before_create :create_slug
  validates_presence_of :name, :servings

  has_many :directions, :class_name => "RecipeDirection", :dependent => :destroy
  has_many :ingredients, :class_name => "RecipeIngredient", :dependent => :destroy

  accepts_nested_attributes_for :directions, 
                                :allow_destroy => true,
                                :reject_if => proc { |attrs| reject = %w(text).all?{ |a| attrs[a].blank? } }
  accepts_nested_attributes_for :ingredients, 
                                :allow_destroy => true,
                                :reject_if => proc { |attrs| reject = %w(how_much ingredient_name preparation).all?{ |a| attrs[a].blank? } }

  def create_slug
    self.slug = self.name.parameterize
  end

  def to_param
    slug
  end

  def as_json(options = nil)
    super( 
      {
        :include => 
          { 
            :ingredients => 
              { 
                :only => [:id], 
                :methods => [:ingredient_name,:how_much] 
              },
            :directions => {} 
          } 
      } 
    )
  end

  paginates_per 10
end
