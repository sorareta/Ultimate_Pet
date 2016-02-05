class Pet < ActiveRecord::Base
	belongs_to :user

  cattr_reader :animal_species, :type_sex
  @@animal_species = %w(cat dog chinchilla)
  @@type_sex = %w(male female)


	validates :name, presence:true
	
  validates :category, inclusion: { in: @@animal_species }
  validates :sex, inclusion: { in: @@type_sex }

	validates_date :birthday, :on_or_before => :today

  	


  def age
    if self.birthday
      number_years = Date.today.year - self.birthday.year
      number_months = Date.today.month - self.birthday.month

      #this condition fix when the year has changed but days < 364
      range_date = self.birthday..Date.today
      number_days = range_date.reduce(0) {|s,d| s + 1}
      condition_below_a_year_fix = number_days < 364

      #this condition show when age < month
      condition_below_a_month_fix = Date.today.day < self.birthday.day && number_months <= 1 

      if number_months == 0 && number_years == 0
        "#{number_days} days"
      elsif number_years == 0 || condition_below_a_year_fix
        if condition_below_a_month_fix
          "#{number_days} days"
        else
          number_months = 12 - number_months.abs if number_months < 0
          "#{number_months} months"
        end
      else
        "#{number_years} years"
      end
    else
      'unknowed'
    end
  end


end


