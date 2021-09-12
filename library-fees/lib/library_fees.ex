defmodule LibraryFees do

  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime.hour<12
  end

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime) do
      checkout_datetime |>
      NaiveDateTime.add(28*24*3600) |>
      NaiveDateTime.to_date()
    else
      checkout_datetime |>
      NaiveDateTime.add(29*24*3600) |>
      NaiveDateTime.to_date()
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    dd=NaiveDateTime.to_date(actual_return_datetime)
    if Date.compare(dd,planned_return_date)==:lt do 0 else
      Date.diff(actual_return_datetime,planned_return_date)
    end
  end

  def monday?(datetime) do
    datetime |> NaiveDateTime.to_date() |> Date.day_of_week()==1
  end

  def calculate_late_fee(checkout_s, return_s, rate) do
    prd=checkout_s |> datetime_from_string() |> return_date()
    rd=datetime_from_string(return_s)
    fee=days_late(prd,rd)*rate
    if monday?(rd) do
      Integer.floor_div(fee,2)
    else
      fee
    end
  end
end
