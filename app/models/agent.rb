class Agent < ActiveRecord::Base
  has_many :ratings
  belongs_to :user
  before_save { self.name = name.titleize }

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }, :uniqueness => { case_sensitive: false, :scope => :suburb }
  validates :suburb, presence: true, length: { minimum: 4 }
  validates :state, presence: true, length: { minimum: 2, maximum: 3 }

  def capitalise_name
    name.upcase!
  end

  def self.search(name, suburb, state, page)
    if name
      name = name.downcase
    end
    if suburb
      suburb = suburb.upcase
    end
    if state
      state = state.upcase
    end
    where('lower(name) LIKE ? AND upper(suburb) LIKE ? AND upper(state) LIKE ?',
          "%#{name}%", "%#{suburb}%", "%#{state}%").paginate(page: page, per_page: 5).order('id DESC')
  end

end
