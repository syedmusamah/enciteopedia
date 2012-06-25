class Article < ActiveRecord::Base

has_many :Aeors
has_many :Editors, :through => :Aeor
has_many :Hists
has_many :Editors, :through => :History
attr_accessible :aName, :Category, :hits, :content, :avatar, :article_id
validates_presence_of :aName, :Category, :content
validates :aName, :length => {:maximum =>50}, :uniqueness => true
validates :Category, :inclusion => { :in => %w(economics general history philosophy culture arts mathematics religion geography science society health people technology applied science), :message => "must be either of the following: economics, general, history, philosophy, culture, arts, mathematics, religion, geography, science, society, health, people, technology, applied science"}

  has_attached_file:avatar


end
