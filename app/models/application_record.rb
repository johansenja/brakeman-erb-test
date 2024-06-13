class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def foo(x)
    # is not picked up by brakeman
    eval x

    # is picked up by brakeman
    User.where("#{x}")
  end
end
