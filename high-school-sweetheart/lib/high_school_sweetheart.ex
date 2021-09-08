defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name |> String.trim() |> String.first()
  end

  def initial(name) do
    (name |> first_letter() |> String.upcase()) <>(".")
  end

  def initials(full_name) do
    [f,l|_]= String.split(full_name," ")
    initial(f) <> " " <> initial(l)
  end

  def pair(full_name1, full_name2) do
    i1=initials(full_name1)
    i2=initials(full_name2)
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{i1}  +  #{i2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
end
end
