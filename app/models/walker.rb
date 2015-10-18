class Walker < ActiveRecord::Base
    belongs_to :team
    def owed_balance
       self.amount_paid - self.amount_owed 
    end
    
    def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("first_name like ?", "%#{query}%") 
    end
end