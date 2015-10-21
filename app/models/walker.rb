class Walker < ActiveRecord::Base
    belongs_to :team
    def owed_balance
        self.amount_owed - self.amount_paid
    end
    
    def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("first_name like ?", "%#{query}%") 
    end
end