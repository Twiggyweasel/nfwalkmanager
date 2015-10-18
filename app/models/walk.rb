class Walk < ActiveRecord::Base
    has_many :teams
    has_many :walkers, :through => :teams
    
    def walker_total
       self.walkers.size 
    end
    
    def amount_raised
      self.walkers.sum(:amount_paid)
    end 
    
    def raised_percent
      (amount_raised/self.goal)*100
    end
end