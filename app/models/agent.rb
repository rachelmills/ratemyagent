class Agent < ActiveRecord::Base
  has_many :ratings
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }, :uniqueness => { case_sensitive: false, :scope => :suburb }
  validates :suburb, presence: true, length: { minimum: 4 }
  validates :state, presence: true, length: { minimum: 2, maximum: 3 }

  def capitalise_name
    name.upcase!
  end

  def self.search_by_name(term, page)
    where('lower(name) LIKE ?', "%#{term.downcase}%").paginate(page: page, per_page: 5).order('id DESC')
  end

  def self.search_by_suburb(term, page)
    where('lower(suburb) LIKE ?', "%#{term.downcase}%").paginate(page: page, per_page: 5).order('id DESC')
  end

end
