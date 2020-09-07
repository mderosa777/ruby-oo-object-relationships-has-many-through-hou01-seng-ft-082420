class Waiter
    attr_accessor :name, :years
    @@all = []
    def initialize(name, years)
      @name = name 
      @years = years
      @@all << self 
    end  

    def self.all
        @@all
    end

    def new_meal(customer, total = 0, tip = 0)
        Meal.new(self, customer, total, tip)
    end

    def meals 
        Meal.all.select do |meal|
            meal.waiter == self 
        end
    end

    def best_tipper
        highest_tip = meals.max do |m1, m2|
            m1.tip <=> m2.tip
        end
        highest_tip.customer
    end




end