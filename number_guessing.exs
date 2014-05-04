defmodule NumberGuessing do

  def guess(actual, range) do
    pivot = div(range.first+range.last, 2)
    IO.puts "Is it #{pivot}?"
    guess_step(actual, range, pivot)
  end

  def guess_step(actual, lower.._, pivot) when actual < pivot do
    guess(actual, lower..pivot)
  end

  def guess_step(actual, _..upper, pivot) when actual > pivot do
    guess(actual, pivot..upper)
  end

  def guess_step(actual, _, pivot) when actual == pivot do
    IO.puts "It is #{pivot}!!!"
  end

end

NumberGuessing.guess(273, 1..1000)