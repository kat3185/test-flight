class Airplane

  attr_accessor :type, :wing_loading, :horsepower, :fuel

  def initialize(type, wing_loading, horsepower, fuel)
  @type = type
  @wing_loading = wing_loading
  @horsepower = horsepower
  @engine_on = false
  @flying = false
  @fuel = fuel
  end

  def start
    if @fuel < 30
      'not enough fuel!'
    elsif @engine_on == true
      "airplane already started"
    else
      @engine_on = true
      @fuel -= 30
      "airplane started"
    end
  end

  def takeoff
    if @fuel < 30
      'not enough fuel!'
    elsif @engine_on == false
      "airplane not started, please start"
    elsif @flying == true
      'the airplane is already in the air'
    else
      @flying = true
      @fuel -= 30
      "airplane launched"
    end
  end

  def land
    if @engine_on == false
      'airplane not started, please start'
    elsif @flying == false
      'airplane already on the ground'
    elsif @fuel < 30
      'not enough fuel! you crash.'
    else
      @flying = false
      'airplane landed'
    end
  end
end
