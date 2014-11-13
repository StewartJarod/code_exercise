require 'minitest/autorun'
require 'sorter'

class SorterTest < ActiveSupport::TestCase
  fkv =
    [
      {filename: "a", key: "a", value: "a"},
      {filename: "a", key: "b", value: "a"},
      {filename: "a", key: "b", value: "b"},
      {filename: "b", key: "a", value: "a"},
      {filename: "b", key: "b", value: "a"},
      {filename: "b", key: "b", value: "b"}
    ]

  vfk =
    [
      {filename: "a", key: "a", value: "a"},
      {filename: "a", key: "b", value: "a"},
      {filename: "b", key: "a", value: "a"},
      {filename: "b", key: "b", value: "a"},
      {filename: "a", key: "b", value: "b"},
      {filename: "b", key: "b", value: "b"}
    ]

  kvf =
    [
      {filename: "a", key: "a", value: "a"},
      {filename: "b", key: "a", value: "a"},
      {filename: "a", key: "b", value: "a"},
      {filename: "b", key: "b", value: "a"},
      {filename: "a", key: "b", value: "b"},
      {filename: "b", key: "b", value: "b"}
    ]

  test "Sanatize the order" do
    assert_equal ["f", "k", "v"], Sorter.sanatize_order(nil)
    assert_equal ["k", "v", "f"], Sorter.sanatize_order("kv")
    assert_equal ["k", "f", "v"], Sorter.sanatize_order("k")
    assert_equal ["f", "v", "k"], Sorter.sanatize_order("fffffvkfkvk")
  end

  test "sort according to the order" do
    assert_equal fkv, Sorter.sort(fkv.shuffle, ["f", "k", "v"])
    assert_equal vfk, Sorter.sort(fkv.shuffle, ["v", "f", "k"])
    assert_equal kvf, Sorter.sort(fkv.shuffle, ["k", "v", "f"])
  end
end
