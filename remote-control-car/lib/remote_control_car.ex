defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:battery_percentage, :distance_driven_in_meters, :nickname]
  def new() do
    %RemoteControlCar{nickname: "none", battery_percentage: 100, distance_driven_in_meters: 0}
  end

  def new(nickname) do
    %RemoteControlCar{nickname: nickname, battery_percentage: 100, distance_driven_in_meters: 0}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: d}) do
    "#{d} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: 0}) do
    "Battery empty"
  end

  def display_battery(%RemoteControlCar{battery_percentage: b}) do
    "Battery at #{b}%"
  end

  def drive(rc=%RemoteControlCar{}) do
    if rc.battery_percentage==0 do
      rc
    else
      %{rc | battery_percentage: rc.battery_percentage-1, distance_driven_in_meters: rc.distance_driven_in_meters+20}
    end
  end
end
