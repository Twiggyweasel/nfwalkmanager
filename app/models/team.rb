class Team < ActiveRecord::Base
    belongs_to :walk
    has_many :walkers
    
    
    def team_raised
       self.walkers.sum(:amount_paid) 
    end
end