defmodule Quebo do

  def shorten(url) do
    if !url do
      raise "errrrrrouu!"
    end

    "que.bo/" <> Base.encode64(url)
  end

  def decode(short_url) do
    { :ok, response } = short_url
      |> String.split("que.bo/")
      |> List.last()
      |> Base.decode64()

    response
  end
end
