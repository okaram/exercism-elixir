defmodule BirdCount do
  def today([]) do nil end
  def today([h|_t]) do h end

  def increment_day_count([]) do [1] end
  def increment_day_count([h|t]) do [h+1|t] end

  def has_day_without_birds?([]) do false end
  def has_day_without_birds?([0|_t]) do true end
  def has_day_without_birds?([_h|t]) do has_day_without_birds?(t) end

  def total([]) do 0 end
  def total([h|t]) do h+total(t) end

  def busy_days([]) do 0 end
  def busy_days([h|t]) when h<5 do busy_days(t) end
  def busy_days([_h|t]) do 1 + busy_days(t) end
end
