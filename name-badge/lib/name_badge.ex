defmodule NameBadge do
  def print(id, name, department) do
    d=  if department==nil do
          "OWNER"
        else
          String.upcase(department)
        end
    if id==nil do
      "#{name} - #{d}"
    else
      "[#{id}] - #{name} - #{d}"
    end
  end
end
