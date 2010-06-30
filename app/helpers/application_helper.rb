# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  class Float
    def round_to(x)
      (self * 10**x).round.to_f / 10**x
    end

    def ceil_to(x)
      (self * 10**x).ceil.to_f / 10**x
    end

    def floor_to(x)
      (self * 10**x).floor.to_f / 10**x
    end
  end
  

end
