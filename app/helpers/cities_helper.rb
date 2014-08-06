module CitiesHelper

  def city_state_name(city)
    if city.state.nil?
      "[Ningún estado]"
    else
      city.state.name
    end
  end

end
