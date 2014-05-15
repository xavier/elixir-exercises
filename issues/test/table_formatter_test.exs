defmodule TableFormatterTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  import Issues.TableFormatter, only: [
    format: 2,
  ]

  alias Issues.TableFormatter, as: TF

  def test_data do
    [
      [c1: "r1 c1", c2: "r1 c2",  c3: "r1 c3", c4: "r1___c4"],
      [c1: "r2 c1", c2: "r2 c2",  c3: "r2 c3", c4: "r2 c4"],
      [c1: "r3 c1", c2: "r3 c2",  c3: "r3 c3", c4: "r3 c4"],
      [c1: "r4 c1", c2: "r4__c2", c3: "r4 c3", c4: "r4 c4"],
    ]
  end

  def test_columns do
    [:c1, :c2, :c4]
  end

  def expected_output do
    Enum.join([
      "c1    | c2     | c4     \n",
      "------+--------+--------\n",
      "r1 c1 | r1 c2  | r1___c4\n",
      "r2 c1 | r2 c2  | r2 c4  \n",
      "r3 c1 | r3 c2  | r3 c4  \n",
      "r4 c1 | r4__c2 | r4 c4  \n",
    ])
  end

  test "formatting of table" do

    output = capture_io fn ->
      TF.format(test_data, test_columns)
    end

    assert output == expected_output
  end

end