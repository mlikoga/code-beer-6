defmodule QueboTest do
  use ExUnit.Case

  test "raises error if url is null" do
    invalid_url = nil
    assert_raise RuntimeError, fn ->
      Quebo.shorten(invalid_url)
    end
  end

  test "returns shorter url" do
    url = "http://google.com/uma-url/longa/muito/longa/mesmo"
    assert String.length(Quebo.shorten(url)) != url
  end

  test "returns url with que.bo domain" do
    url = "http://google.com/uma-url/longa/muito/longa/mesmo"
    assert String.starts_with?(Quebo.shorten(url), "que.bo")
  end

  test "returns original url" do
    short_url = "que.bo/aHR0cDovL2dvb2dsZS5jb20vdW1hLXVybC9sb25nYS9tdWl0by9sb25nYS9tZXNtbw=="
    assert Quebo.decode(short_url) == "http://google.com/uma-url/longa/muito/longa/mesmo"
  end
end
